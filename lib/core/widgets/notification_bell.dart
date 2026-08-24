import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/features/notifications/widgets/notifications_dialog.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  int _unreadCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUnreadCount();
  }

  Future<void> _loadUnreadCount() async {
    try {
      final response = await getIt<ApiService>().getNotificationsUnreadCount();
      final data = response['data'] as Map<String, dynamic>?;
      if (mounted)
        setState(() => _unreadCount = data?['unreadCount'] as int? ?? 0);
    } catch (_) {
      // The bell remains usable even if its badge cannot be loaded.
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'الإشعارات',
      onPressed: () async {
        await showNotificationsDialog(context);
        _loadUnreadCount();
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(Icons.notifications, color: AppColors.primaryColor, size: 40.r),
          if (_unreadCount > 0)
            Positioned(
              right: -4.w,
              top: -3.h,
              child: Container(
                constraints: BoxConstraints(minWidth: 17.w, minHeight: 17.w),
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  _unreadCount > 99 ? '99+' : '$_unreadCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
