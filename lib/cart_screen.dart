import 'package:expereal_test/blocs/cart_bloc/cart_bloc.dart';
import 'package:expereal_test/widgets/cart_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/item_count_widget.dart';
import 'widgets/product_list_tile.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is CartLoaded) {
          return ListView.builder(
            itemCount:
                state.cart.productQuantity(state.cart.products).keys.length,
            itemBuilder: (BuildContext context, index) {
              return CartTile(
                quantity: state.cart
                    .productQuantity(state.cart.products)
                    .values
                    .elementAt(index),
                product: state.cart
                    .productQuantity(state.cart.products)
                    .keys
                    .elementAt(index),
              );
            },
          );
        }
        return const SizedBox();
      }),
      floatingActionButton: TotalCounter(),
    );
  }
}
