import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';

abstract class CustomerOrdersState {}

class CustomerOrdersInitial extends CustomerOrdersState {}

class CustomerOrdersLoading extends CustomerOrdersState {}

class CustomerOrdersSuccess extends CustomerOrdersState {
  final List<CustomerOrder> orders;

  CustomerOrdersSuccess(this.orders);
}

class CustomerOrdersError extends CustomerOrdersState {
  final String message;

  CustomerOrdersError(this.message);
}
