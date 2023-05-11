import 'package:expereal_test/widgets/counter_button.dart';
import 'package:flutter/material.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTile extends StatefulWidget {
  final Product? product;
  final int quantity;
  const CartTile({super.key, this.product, required this.quantity});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  Product? _product;
  @override
  void initState() {
    super.initState();

    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _product?.productName ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _product?.price.toString() ?? "",
                  style: const TextStyle(
                      //fontWeight: FontWeight.w600,
                      color: Colors.black45,
                      fontSize: 16),
                ),
              ],
            ),
            CounterButton(
              quantity: widget.quantity,
              product: widget.product,
            ),
            // Text(
            //   widget.quantity.toString(),
            //   style: const TextStyle(
            //       //fontWeight: FontWeight.w600,
            //       color: Colors.red,
            //       fontSize: 16),
            // ),
          ],
        ));
  }
}
