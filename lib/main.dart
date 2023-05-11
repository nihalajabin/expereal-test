import 'package:expereal_test/blocs/cart_bloc/cart_bloc.dart';
import 'package:expereal_test/cart_screen.dart';
import 'package:expereal_test/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()
            ..add(
              const CartStarted(),
            ),
        ),
      ],
      child: MaterialApp(
          title: 'tech',
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: Brightness.light,
          ),
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) {
              return ProductListView();
            },
            '/cart': (context) => CartScreen(),
          }),
    );
  }
}
