import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String customerId;
  final List<OrderItem> items;
  final DateTime createdAt;
  final OrderStatus status;
  final double total;

  const Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.createdAt,
    required this.status,
    required this.total,
  }) : assert(total >= 0, 'Total must be non-negative');

  Order copyWith({
    String? id,
    String? customerId,
    List<OrderItem>? items,
    DateTime? createdAt,
    OrderStatus? status,
    double? total,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [id, customerId, items, createdAt, status, total];
}

class OrderItem extends Equatable {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  }) : assert(quantity > 0, 'Quantity must be positive'),
       assert(price >= 0, 'Price must be non-negative');

  @override
  List<Object?> get props => [productId, productName, quantity, price];
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}