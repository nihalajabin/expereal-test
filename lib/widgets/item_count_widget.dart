import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class TotalCounter extends StatefulWidget {
  const TotalCounter({super.key});

  @override
  State<TotalCounter> createState() => _TotalCounterState();
}

class _TotalCounterState extends State<TotalCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Stack(
          alignment: Alignment(1.4, -1.5),
          children: [
            FloatingActionButton(
              // Your actual Fab
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Icon(Icons.shopping_cart_sharp),
              //backgroundColor: Colors.deepOrange,
            ),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoaded) {
                final totalCount = state.cart.products?.length;

                return Container(
                  // This is your Badge
                  child: Center(
                    // Here you can put whatever content you want inside your Badge
                    child: Text(totalCount.toString(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(minHeight: 32, minWidth: 32),
                  decoration: BoxDecoration(
                    // This controls the shadow
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withAlpha(50))
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue, // This would be color of the Badge
                  ),
                );
                //  },
                // );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
