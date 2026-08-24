import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';

abstract class CustomerOrdersRepository {
  Future<ApiResult<List<CustomerOrder>>> getOrders({
    int page,
    int limit,
    String? status,
  });
}
