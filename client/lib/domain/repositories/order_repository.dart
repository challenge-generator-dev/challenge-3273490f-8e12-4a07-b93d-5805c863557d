import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders({bool refresh = false});
  Future<Order> getOrderById(String id);
  Future<void> refreshOrders();
}