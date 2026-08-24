import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';

abstract class CustomerOrdersRemoteDataSource {
  Future<ApiResult<List<CustomerOrder>>> getOrders({
    int page,
    int limit,
    String? status,
  });
}

@Injectable(as: CustomerOrdersRemoteDataSource)
class CustomerOrdersRemoteDataSourceImpl
    implements CustomerOrdersRemoteDataSource {
  final ApiService _apiService;

  CustomerOrdersRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<List<CustomerOrder>>> getOrders({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    try {
      final response = await _apiService.getCustomerOrders(
        page: page,
        limit: limit,
        status: status,
      );

      return ApiResult.success(
        response.data.map((order) => order.toEntity()).toList(),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
