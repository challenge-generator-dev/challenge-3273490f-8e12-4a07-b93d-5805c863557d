// TODO(reto): Implementar la fuente de datos remota para órdenes
// Debe:
// 1. Consumir la API aprovisionada con Terraform (API Gateway + Lambda)
// 2. Manejar errores de red y timeout
// 3. Implementar caché local para evitar llamadas innecesarias
// 4. Soportar pull-to-refresh

import 'package:dio/dio.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> getOrderById(String id);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<List<OrderModel>> getOrders() async {
    // TODO(reto): Implementar llamada a la API
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> getOrderById(String id) async {
    // TODO(reto): Implementar llamada a la API
    throw UnimplementedError();
  }
}