import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/orders/data/data_source/remote/customer_orders_remote_data_source.dart';
import 'package:salla7ly/features/orders/domain/entities/customer_order.dart';
import 'package:salla7ly/features/orders/domain/repositories/customer_orders_repository.dart';

@Injectable(as: CustomerOrdersRepository)
class CustomerOrdersRepositoryImpl implements CustomerOrdersRepository {
  final CustomerOrdersRemoteDataSource _remoteDataSource;

  CustomerOrdersRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<CustomerOrder>>> getOrders({
    int page = 1,
    int limit = 20,
    String? status,
  }) {
    return _remoteDataSource.getOrders(
      page: page,
      limit: limit,
      status: status,
    );
  }
}
