import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:web_socket/io_web_socket.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/networking/api_constants.dart';
import 'package:salla7ly/core/networking/socket_events.dart';

@lazySingleton
class SocketService {
  io.Socket? _socket;

  final _offerNewController =
      StreamController<OfferNewEvent>.broadcast();

  final _requestUpdatedController =
      StreamController<RequestUpdatedEvent>.broadcast();

  final _reconnectedController =
      StreamController<void>.broadcast();

  Stream<OfferNewEvent> get offerNew =>
      _offerNewController.stream;

  Stream<RequestUpdatedEvent> get requestUpdated =>
      _requestUpdatedController.stream;

  Stream<void> get reconnected =>
      _reconnectedController.stream;

  bool get isConnected =>
      _socket?.connected ?? false;

  bool _hasConnectedOnce = false;

  // Prevent multiple refresh calls at the same time.
  bool _isRefreshing = false;

  // Prevent refresh loops.
  DateTime? _lastRefreshAttempt;

  static const _refreshCooldown =
      Duration(seconds: 15);

  Future<void> connect() async {
    final token =
        await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      print('SOCKET: no access token');
      return;
    }

    if (_socket?.connected == true) {
      return;
    }

    // Socket exists but is disconnected.
    // Reuse it with the latest token.
    if (_socket != null) {
      _socket!.auth = {
        'token': token,
      };

      print('SOCKET: reconnecting with current token');

      _socket!.connect();
      return;
    }

    print('SOCKET: creating connection');

    _socket = io.io(
      ApiConstants.socketUrl,
      io.OptionBuilder()
          // Connect directly over WebSocket. The server is configured on the
          // same origin as the REST API, so no separate socket port is needed.
          .setTransports(['websocket'])
          .setAuth({
            'token': token,
          })
          .setPath('/socket.io')
          .setWebSocketConnector((uri, {protocols, headers}) async {
            // socket_io_client can pass port 0 when the URL has the default
            // HTTPS port. Explicitly restore 443 before the native handshake.
            final targetUri = uri.port == 0 ? uri.replace(port: 443) : uri;

            print('SOCKET: opening WebSocket -> $targetUri');

            final rawSocket = await WebSocket.connect(
              targetUri.toString(),
              protocols: protocols,
              headers: headers,
            );

            return IOWebSocket.fromWebSocket(rawSocket);
          })
          // socket_io_client caches connections by origin even after dispose.
          // This service owns its connection, so it must not reuse stale options.
          .enableForceNew()
          .disableAutoConnect()
          .build(),
    );

    _socket!
      ..on(
        SocketEvents.offerNew,
        _handleOfferNew,
      )
      ..on(
        SocketEvents.requestUpdated,
        _handleRequestUpdated,
      )
      ..onConnect((_) {
        print('SOCKET: ===============================');
        print('SOCKET: connected successfully');
        print('SOCKET: id = ${_socket!.id}');
        print('SOCKET: ===============================');

        if (_hasConnectedOnce) {
          // This is a reconnect, not the first connection.
          _reconnectedController.add(null);
        }

        _hasConnectedOnce = true;
      })
      ..onConnectError(
        (err) => _handleConnectError(err),
      )
      ..onError((err) {
        print(
          'SOCKET: general error -> $err',
        );
      })
      ..onDisconnect((reason) {
        print(
          'SOCKET: disconnected -> $reason',
        );
      })
      ..connect();
  }

  void _handleConnectError(dynamic err) {
    print(
      'SOCKET: connect error -> $err',
    );

    if (!_isAuthError(err)) {
      // Network / proxy / websocket problem.
      // Do NOT refresh the token for a normal network error.
      return;
    }

    _reconnectWithFreshToken();
  }

  bool _isAuthError(dynamic err) {
    final message =
        err?.toString().toLowerCase() ?? '';

    return message.contains('unauthorized') ||
        message.contains('auth') ||
        message.contains('jwt') ||
        message.contains('token');
  }

  void _handleOfferNew(dynamic data) {
    try {
      if (data is! Map) {
        print(
          'SOCKET: invalid offer:new payload -> $data',
        );
        return;
      }

      final event = OfferNewEvent.fromJson(
        Map<String, dynamic>.from(data),
      );

      print(
        'SOCKET: offer:new -> '
        'requestId=${event.requestId}, '
        'offerId=${event.offer?.offerId}',
      );

      _offerNewController.add(event);
    } catch (e) {
      print(
        'SOCKET: failed to parse offer:new -> $e',
      );
    }
  }

  void _handleRequestUpdated(dynamic data) {
    try {
      if (data is! Map) {
        print(
          'SOCKET: invalid request:updated payload -> $data',
        );
        return;
      }

      final event = RequestUpdatedEvent.fromJson(
        Map<String, dynamic>.from(data),
      );

      print(
        'SOCKET: request:updated -> '
        'requestId=${event.requestId}, '
        'status=${event.status}',
      );

      _requestUpdatedController.add(event);
    } catch (e) {
      print(
        'SOCKET: failed to parse request:updated -> $e',
      );
    }
  }

  Future<void> _reconnectWithFreshToken() async {
    if (_isRefreshing) {
      return;
    }

    final now = DateTime.now();

    if (_lastRefreshAttempt != null &&
        now.difference(_lastRefreshAttempt!) <
            _refreshCooldown) {
      print(
        'SOCKET: skipping refresh, still in cooldown',
      );
      return;
    }

    _lastRefreshAttempt = now;
    _isRefreshing = true;

    try {
      print(
        'SOCKET: refreshing access token...',
      );

      final refreshed =
          await _refreshAccessToken();

      if (!refreshed) {
        print(
          'SOCKET: token refresh failed',
        );
        return;
      }

      final newToken =
          await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );

      if (newToken.isEmpty) {
        print(
          'SOCKET: refreshed token is empty',
        );
        return;
      }

      _socket?.auth = {
        'token': newToken,
      };

      print(
        'SOCKET: reconnecting with fresh token',
      );

      _socket?.connect();
    } finally {
      _isRefreshing = false;
    }
  }

  Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken =
          await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.refreshToken,
      );

      if (refreshToken.isEmpty) {
        print(
          'SOCKET: no refresh token',
        );
        return false;
      }

      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final response = await refreshDio.post(
        ApiConstants.refreshOtp,
        data: {
          'refreshToken': refreshToken,
        },
      );

      final tokens =
          response.data['data']?['tokens'];

      final newAccessToken =
          tokens?['accessToken'] as String?;

      final newRefreshToken =
          tokens?['refreshToken'] as String?;

      if (newAccessToken == null ||
          newAccessToken.isEmpty) {
        return false;
      }

      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        newAccessToken,
      );

      if (newRefreshToken != null &&
          newRefreshToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          newRefreshToken,
        );
      }

      return true;
    } catch (e) {
      print(
        'SOCKET: refresh exception -> $e',
      );
      return false;
    }
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _hasConnectedOnce = false;
  }

  Future<void> dispose() async {
    disconnect();

    await _offerNewController.close();
    await _requestUpdatedController.close();
    await _reconnectedController.close();
  }
}