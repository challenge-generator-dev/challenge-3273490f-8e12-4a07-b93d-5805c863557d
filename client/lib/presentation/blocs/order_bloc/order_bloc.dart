import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/usecases/get_orders.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders getOrders;

  OrderBloc({required this.getOrders}) : super(const OrderInitial()) {
    on<FetchOrders>(_onFetchOrders);
    on<RefreshOrders>(_onRefreshOrders);
    on<OrderSelected>(_onOrderSelected);
    on<OrdersError>(_onOrdersError);
  }

  Future<void> _onFetchOrders(
    FetchOrders event,
    Emitter<OrderState> emit,
  ) async {
    final currentState = state;
    List<Order>? previousOrders;
    
    if (currentState is OrderLoaded) {
      previousOrders = currentState.orders;
    }

    emit(const OrderLoading());

    try {
      final orders = await getOrders(refresh: event.refresh);
      emit(OrderLoaded(orders: orders));
    } catch (e) {
      emit(OrderError(
        message: _extractErrorMessage(e),
        previousOrders: previousOrders,
      ));
    }
  }

  Future<void> _onRefreshOrders(
    RefreshOrders event,
    Emitter<OrderState> emit,
  ) async {
    final currentState = state;
    
    if (currentState is OrderLoaded) {
      emit(currentState.copyWith(isRefreshing: true));
    }

    try {
      final orders = await getOrders(refresh: true);
      emit(OrderLoaded(orders: orders));
    } catch (e) {
      emit(OrderError(
        message: _extractErrorMessage(e),
        previousOrders: currentState is OrderLoaded ? currentState.orders : null,
      ));
    }
  }

  void _onOrderSelected(
    OrderSelected event,
    Emitter<OrderState> emit,
  ) {
    final currentState = state;
    
    if (currentState is OrderLoaded) {
      final selectedOrder = currentState.orders.firstWhere(
        (order) => order.id == event.orderId,
        orElse: () => currentState.orders.first,
      );
      
      emit(currentState.copyWith(selectedOrder: selectedOrder));
    }
  }

  void _onOrdersError(
    OrdersError event,
    Emitter<OrderState> emit,
  ) {
    final currentState = state;
    emit(OrderError(
      message: event.message,
      previousOrders: currentState is OrderLoaded ? currentState.orders : null,
    ));
  }

  String _extractErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}