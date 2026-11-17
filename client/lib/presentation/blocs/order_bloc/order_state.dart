import 'package:equatable/equatable.dart';
import '../../../domain/entities/order.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final Order? selectedOrder;
  final bool isRefreshing;

  const OrderLoaded({
    required this.orders,
    this.selectedOrder,
    this.isRefreshing = false,
  });

  OrderLoaded copyWith({
    List<Order>? orders,
    Order? selectedOrder,
    bool? isRefreshing,
  }) {
    return OrderLoaded(
      orders: orders ?? this.orders,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [orders, selectedOrder, isRefreshing];
}

class OrderError extends OrderState {
  final String message;
  final List<Order>? previousOrders;

  const OrderError({
    required this.message,
    this.previousOrders,
  });

  @override
  List<Object?> get props => [message, previousOrders];
}