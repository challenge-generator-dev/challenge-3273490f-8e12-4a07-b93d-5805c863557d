import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {
  final bool refresh;

  const FetchOrders({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}

class RefreshOrders extends OrderEvent {}

class OrderSelected extends OrderEvent {
  final String orderId;

  const OrderSelected(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class OrdersError extends OrderEvent {
  final String message;

  const OrdersError(this.message);

  @override
  List<Object?> get props => [message];
}