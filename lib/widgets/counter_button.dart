import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/product.dart';

class CounterButton extends StatefulWidget {
  final Product? product;
  final int quantity;

  CounterButton({this.product, required this.quantity});

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
      // widget.onCountChanged(_count); // notify parent widget of count change
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            BlocProvider.of<CartBloc>(context).add(AddProduct(widget.product!));

            //  _counter=_
            //  _updateCart();
          },
        ),
        Text(widget.quantity.toString() ?? '0'),
        IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CartBloc>(context)
                  .add(RemoveProduct(widget.product!));
            }),
      ],
    );
  }
}
