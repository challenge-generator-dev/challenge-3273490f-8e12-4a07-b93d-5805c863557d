import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'domain/usecases/get_orders.dart';
import 'data/repositories/order_repository_impl.dart';
import 'data/datasources/order_remote_data_source.dart';
import 'presentation/blocs/order_bloc/order_bloc.dart';
import 'presentation/blocs/order_bloc/order_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    const baseUrl = 'https://api.example.com';
    final remoteDataSource = OrderRemoteDataSourceImpl(dio: dio, baseUrl: baseUrl);
    final repository = OrderRepositoryImpl(remoteDataSource: remoteDataSource);
    final getOrders = GetOrders(repository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => OrderBloc(getOrders: getOrders)..add(const FetchOrders()),
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}