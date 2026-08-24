import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/networking/api_constants.dart';
import 'package:salla7ly/core/networking/socket_events.dart';

@lazySingleton
class SocketService {
  io.Socket? _socket;

  final _offerNewController = StreamController<OfferNewEvent>.broadcast();
  final _requestUpdatedController =
      StreamController<RequestUpdatedEvent>.broadcast();
  final _jobNewController = StreamController<JobNewEvent>.broadcast();
  final _jobClosedController = StreamController<JobClosedEvent>.broadcast();

  Stream<OfferNewEvent> get offerNew => _offerNewController.stream;
  Stream<RequestUpdatedEvent> get requestUpdated =>
      _requestUpdatedController.stream;
  Stream<JobNewEvent> get jobNew => _jobNewController.stream;
  Stream<JobClosedEvent> get jobClosed => _jobClosedController.stream;

  bool get isConnected => _socket?.connected ?? false;

  Future<void> connect() async {
    if (_socket != null) {
      if (!_socket!.connected) {
        _socket!.connect();
      }
      return;
    }

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    _socket = io.io(
      ApiConstants.socketUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .disableAutoConnect()
          .build(),
    );

    _socket!
      ..on(SocketEvents.offerNew, _handleOfferNew)
      ..on(SocketEvents.requestUpdated, _handleRequestUpdated)
      ..on(SocketEvents.jobNew, _handleJobNew)
      ..on(SocketEvents.jobClosed, _handleJobClosed)
      ..onConnectError((_) => _reconnectWithFreshToken())
      ..connect();
  }

  void _handleOfferNew(dynamic data) {
    _offerNewController.add(
      OfferNewEvent.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  void _handleRequestUpdated(dynamic data) {
    _requestUpdatedController.add(
      RequestUpdatedEvent.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  void _handleJobNew(dynamic data) {
    _jobNewController.add(
      JobNewEvent.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  void _handleJobClosed(dynamic data) {
    _jobClosedController.add(
      JobClosedEvent.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<void> _reconnectWithFreshToken() async {
    final refreshed = await _refreshAccessToken();
    if (!refreshed) return;

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    _socket?.auth = {'token': token};
    _socket?.connect();
  }

  Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.refreshToken,
      );

      if (refreshToken.isEmpty) return false;

      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {'Content-Type': 'application/json'},
        ),
      );

      final response = await refreshDio.post(
        ApiConstants.refreshOtp,
        data: {'refreshToken': refreshToken},
      );

      final tokens = response.data['data']?['tokens'];
      final newAccessToken = tokens?['accessToken'] as String?;
      final newRefreshToken = tokens?['refreshToken'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) return false;

      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        newAccessToken,
      );

      if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          newRefreshToken,
        );
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }
}
