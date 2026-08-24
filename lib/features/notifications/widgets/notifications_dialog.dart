import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

Future<void> showNotificationsDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => const _NotificationsDialog(),
  );
}

class _NotificationsDialog extends StatefulWidget {
  const _NotificationsDialog();

  @override
  State<_NotificationsDialog> createState() => _NotificationsDialogState();
}

class _NotificationsDialogState extends State<_NotificationsDialog> {
  List<Map<String, dynamic>> _notifications = const [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    try {
      final response = await getIt<ApiService>().getNotifications(limit: 20);
      final data = (response['data'] as List? ?? const [])
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
      if (mounted)
        setState(() {
          _notifications = data;
          _isLoading = false;
        });
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 360.w, maxHeight: 340.h),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              )
            : _notifications.isEmpty
            ? const _EmptyNotifications()
            : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                itemCount: _notifications.length,
                separatorBuilder: (_, __) => SizedBox(height: 7.h),
                itemBuilder: (_, index) =>
                    _NotificationCard(notification: _notifications[index]),
              ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});

  final Map<String, dynamic> notification;

  @override
  Widget build(BuildContext context) {
    final type = notification['type']?.toString() ?? '';
    final icon = type == 'POINTS_GRANTED'
        ? Icons.add_circle_outline
        : Icons.person;

    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.w),
        boxShadow: const [
          BoxShadow(
            color: Color(0x661B2D5B),
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 27.r),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  notification['title']?.toString() ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: AppStyles.semiBold11primary,
                ),
                Text(
                  notification['body']?.toString() ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: AppStyles.mediun12Primary.copyWith(fontSize: 9.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Text('لا توجد إشعارات', style: AppStyles.semiBold14primary),
    );
  }
}
