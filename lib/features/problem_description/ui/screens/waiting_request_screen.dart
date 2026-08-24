import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/socket_service.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_acceptance_progress.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/get_offers_use_case.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_bloc_listener.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_cubit.dart';

class WaitingRequestScreen extends StatefulWidget {
  const WaitingRequestScreen({
    super.key,
    required this.requestId,
  });

  final String requestId;

  @override
  State<WaitingRequestScreen> createState() =>
      _WaitingRequestScreenState();
}

class _WaitingRequestScreenState
    extends State<WaitingRequestScreen> {
  final SocketService _socketService =
      getIt<SocketService>();

  final GetOffersUseCase _getOffersUseCase =
      getIt<GetOffersUseCase>();

  StreamSubscription? _offerNewSubscription;

  Timer? _pollingTimer;

  static const _pollingInterval = Duration(seconds: 5);

  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _connectAndListen();
    _startPolling();
  }

  void _startPolling() {
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(_pollingInterval, (_) {
      _pollOffersOnce();
    });
  }

  Future<void> _pollOffersOnce() async {
    if (!mounted || _navigated) {
      return;
    }

    final result =
        await _getOffersUseCase.invoke(widget.requestId);

    if (!mounted || _navigated) {
      return;
    }

    result.when(
      success: (offers) {
        if (offers.isNotEmpty) {
          print(
            'WAITING SCREEN: offer found via polling '
            '(${offers.length})',
          );
          _goToOffersScreen();
        }
      },
      failure: (error) {
        print(
          'WAITING SCREEN: polling error -> $error',
        );
      },
    );
  }

  void _goToOffersScreen() {
    if (!mounted || _navigated) {
      return;
    }

    _navigated = true;
    _pollingTimer?.cancel();

    context.pushReplacementNamed(
      Routes.requestTechnicianScreen,
      arguments: widget.requestId,
    );
  }

  Future<void> _connectAndListen() async {
    // Listen BEFORE connecting so we don't miss
    // a very fast offer:new event.
    _offerNewSubscription =
        _socketService.offerNew.listen((event) {
      if (event.requestId != widget.requestId) {
        return;
      }

      print(
        'WAITING SCREEN: offer received -> '
        '${event.offer?.offerId}',
      );

      _goToOffersScreen();
    });

    await _socketService.connect();

    if (_socketService.isConnected) {
      print(
        'WAITING SCREEN: socket connected',
      );
    }
  }

  @override
  void dispose() {
    _offerNewSubscription?.cancel();
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 244.w,
                    height: 140.h,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'طلب فني خبير',
                  style: AppStyles.bold20Primary,
                ),
                verticalSpace(40),
                TechnicianAcceptanceProgress(),
                verticalSpace(40),
                Center(
                  child: DottedBorder(
                    options:
                        RoundedRectDottedBorderOptions(
                      radius: Radius.circular(4.r),
                      dashPattern: const [
                        8,
                        4,
                      ],
                      strokeWidth: 1.5,
                      color:
                          AppColors.primaryColor,
                    ),
                    child: Container(
                      width: 275.w,
                      constraints:
                          BoxConstraints(
                        minHeight: 50.h,
                      ),
                      decoration:
                          BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                          4.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'استني طلبات الفنين',
                          style:
                              AppStyles.bold20Primary,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(24),
                CustomElevatedButton(
                  text: 'خرجني',
                  onPressed: () {
                    context.read<CancelRequestCubit>().cancelRequest(
                      widget.requestId,
                    );
                  },
                ),
                const CancelRequestBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
