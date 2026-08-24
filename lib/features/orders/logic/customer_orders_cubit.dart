import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/orders/domain/use_cases/get_customer_orders_use_case.dart';
import 'package:salla7ly/features/orders/logic/customer_orders_state.dart';

@injectable
class CustomerOrdersCubit extends Cubit<CustomerOrdersState> {
  final GetCustomerOrdersUseCase _getCustomerOrdersUseCase;

  CustomerOrdersCubit(this._getCustomerOrdersUseCase)
      : super(CustomerOrdersInitial());

  Future<void> getOrders() async {
    emit(CustomerOrdersLoading());

    final result = await _getCustomerOrdersUseCase.execute();

    result.when(
      success: (orders) => emit(CustomerOrdersSuccess(orders)),
      failure: (error) => emit(
        CustomerOrdersError(error.error?.message ?? 'حدث خطأ، حاول مرة أخرى'),
      ),
    );
  }
}
