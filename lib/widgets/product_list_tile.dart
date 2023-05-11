import 'package:flutter/material.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListTile extends StatefulWidget {
  final Product? product;
  const ProductListTile({super.key, this.product});

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  Product? _product;
  CartBloc? cartBloc;
  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
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
            GestureDetector(
              onTap: () {
                BlocProvider.of<CartBloc>(context).add(AddProduct(_product!));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  //color: Colors.white,

                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                child: Text(
                  "Add",
                  style: const TextStyle(
                      //fontWeight: FontWeight.w600,
                      color: Colors.red,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ));
  }

  _addToCart(Product product) {
    cartBloc?.add(AddProduct(product));
  }
}
