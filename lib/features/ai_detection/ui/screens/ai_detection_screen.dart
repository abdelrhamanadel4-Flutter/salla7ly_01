import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_cubit.dart';
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_state.dart';
import 'package:salla7ly/features/ai_detection/ui/widgets/ai_detection_bloc_listener.dart';
import 'package:salla7ly/features/ai_detection/ui/widgets/ai_message_widget.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_bloc_listener.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_bloc_listener.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_cubit.dart';

class AiDetectionScreen extends StatefulWidget {
  final String requestId;

  const AiDetectionScreen({super.key, required this.requestId});

  @override
  State<AiDetectionScreen> createState() => _AiDetectionScreenState();
}

class _AiDetectionScreenState extends State<AiDetectionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AiEstimationCubit>().getAiEstimation(widget.requestId);
  }

  String _getSeverityMessage(String? severity) {
    switch (severity) {
      case 'SMALL':
        return 'من وجهة نظري مشكلتك صغيرة';
      case 'MEDIUM':
        return 'من وجهة نظري مشكلتك متوسطة';
      case 'LARGE':
        return 'من وجهة نظري مشكلتك كبيرة';
      default:
        return 'من وجهة نظري مشكلتك غير محددة';
    }
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
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),

                Text('ال Ai بيقول ......', style: AppStyles.bold24Primary),

                verticalSpace(16),

                BlocBuilder<AiEstimationCubit, AiEstimationState>(
                  builder: (context, state) {
                    return state.whenOrNull(
                          success: (data) {
                            final estimation = data.estimation;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AiMessageWidget(
                                  message: _getSeverityMessage(
                                    estimation?.severity,
                                  ),
                                ),

                                verticalSpace(16),

                                AiMessageWidget(
                                  message:
                                      'ده معناه ان سعرها يتراوح بين......\n'
                                      '${estimation?.minPrice ?? '-'} - '
                                      '${estimation?.maxPrice ?? '-'} جنيه',
                                ),

                                verticalSpace(16),

                                AiMessageWidget(
                                  message: 'هل ابعت طلب للفنين المتاحين ؟؟؟؟',
                                ),

                                verticalSpace(16),

                                CustomElevatedButton(
                                  text: 'ابعت',
                                  onPressed: () {
                                    context.read<PublishCubit>().publishRequest(
                                      widget.requestId,
                                    );
                                    
                                  },
                                ),

                                verticalSpace(16),

                                CustomElevatedButton(
                                  text: 'خرجني',
                                  onPressed: () {
                                    context.read<CancelRequestCubit>().cancelRequest(
                                      widget.requestId,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                          error: (_) {
                            return const SizedBox.shrink();
                          },
                        ) ??
                        const SizedBox.shrink();
                  },
                ),
                const PublishBlocListener(),
                const AiEstimationBlocListener(),
                const CancelRequestBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
