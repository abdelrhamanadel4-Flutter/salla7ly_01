import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';
import 'package:salla7ly/features/orders/domain/repositories/customer_orders_repository.dart';

@injectable
class GetCustomerOrdersUseCase {
  final CustomerOrdersRepository _repository;

  GetCustomerOrdersUseCase(this._repository);

  Future<ApiResult<List<CustomerOrder>>> execute({
    int page = 1,
    int limit = 20,
    String? status,
  }) {
    return _repository.getOrders(page: page, limit: limit, status: status);
  }
}
