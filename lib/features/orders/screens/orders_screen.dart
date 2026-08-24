import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/offers/widgets/offers_header.dart';
import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';
import 'package:salla7ly/features/orders/logic/customer_orders_cubit.dart';
import 'package:salla7ly/features/orders/logic/customer_orders_state.dart';
import 'package:salla7ly/features/orders/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CustomerOrdersCubit>()..getOrders(),
      child: const _OrdersView(),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: context.read<CustomerOrdersCubit>().getOrders,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const OffersHeader(showBackButton: false),
                      SizedBox(height: 20.h),
                      Text('طلباتك السابقة', style: AppStyles.semiBold24Primary),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
                builder: (context, state) {
                  if (state is CustomerOrdersLoading) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is CustomerOrdersError) {
                    return SliverFillRemaining(
                      child: Center(child: Text(state.message)),
                    );
                  }

                  final orders = state is CustomerOrdersSuccess
                      ? state.orders
                      : <CustomerOrder>[];

                  if (orders.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'لا توجد طلبات سابقة',
                          style: AppStyles.mediun12Primary,
                        ),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final order = orders[index];

                          return OrderCard(
                            messagename: order.title ?? 'طلب خدمة',
                            date: _orderDate(order),
                            status: _statusLabel(order.status),
                            price: _orderPrice(order),
                          );
                        },
                        childCount: orders.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _orderDate(CustomerOrder order) {
    final createdAt = DateTime.tryParse(order.createdAt ?? '');

    if (createdAt == null) {
      return 'التاريخ غير محدد';
    }

    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }

  String _orderPrice(CustomerOrder order) {
    if (order.visitFee != null && order.visitFee!.isNotEmpty) {
      return 'السعر: ${order.visitFee} جنيه';
    }

    return 'السعر غير محدد';
  }

  String _statusLabel(String? status) {
    switch (status) {
      case 'WAITING_FOR_TECHNICIAN':
        return 'في انتظار فني';
      case 'TECHNICIAN_SELECTED':
        return 'تم اختيار الفني';
      case 'ON_THE_WAY':
        return 'الفني في الطريق';
      case 'ARRIVED':
        return 'وصل الفني';
      case 'IN_PROGRESS':
        return 'جاري تنفيذ الطلب';
      case 'COMPLETED':
        return 'مكتمل';
      case 'CANCELLED':
        return 'ملغي';
      default:
        return 'حالة الطلب غير محددة';
    }
  }
}
