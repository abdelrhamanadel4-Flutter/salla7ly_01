import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/networking/socket_service.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_acceptance_progress.dart';

class WaitingRequestScreen extends StatefulWidget {
  const WaitingRequestScreen({super.key, required this.requestId});

  final String requestId;

  @override
  State<WaitingRequestScreen> createState() => _WaitingRequestScreenState();
}

class _WaitingRequestScreenState extends State<WaitingRequestScreen> {
  final SocketService _socketService = getIt<SocketService>();
  StreamSubscription? _offerNewSubscription;

  @override
  void initState() {
    super.initState();
    _listenForFirstOffer();
  }

  Future<void> _listenForFirstOffer() async {
    await _socketService.connect();

    _offerNewSubscription = _socketService.offerNew.listen((event) {
      if (event.requestId != widget.requestId) return;
      if (!mounted) return;

      context.pushReplacementNamed(
        Routes.requestTechnicianScreen,
        arguments: widget.requestId,
      );
    });
  }

  @override
  void dispose() {
    _offerNewSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 244.w,
                    height: 140.h,
                  ),
                ),
                verticalSpace(8),
                Text('طلب فني خبير', style: AppStyles.bold20Primary),
                verticalSpace(40),
                TechnicianAcceptanceProgress(),
                verticalSpace(40),
                Center(
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(4.r),
                      dashPattern: const [8, 4],
                      strokeWidth: 1.5,
                      color: AppColors.primaryColor,
                    ),
                    child: Container(
                      width: 275.w,
                      constraints: BoxConstraints(minHeight: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          'استني طلبات الفنين',
                          style: AppStyles.bold20Primary,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(24),
                CustomElevatedButton(text: 'خرجني', onPressed: () {
                  context.pushReplacementNamed(Routes.mainnavigationscreen);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
