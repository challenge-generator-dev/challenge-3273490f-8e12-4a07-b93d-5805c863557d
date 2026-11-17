import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  Future<List<Order>> call({bool refresh = false}) async {
    try {
      return await repository.getOrders(refresh: refresh);
    } catch (e) {
      throw Exception('Failed to fetch orders: ${e.toString()}');
    }
  }
}