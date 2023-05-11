import 'package:expereal_test/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';
import 'models/product.dart';
import 'widgets/product_list_tile.dart';
import 'widgets/item_count_widget.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final List<Product> productList = const [
    Product(id: "1", productName: "Burger", price: 100),
    Product(
      id: '2',
      productName: "FriedRice",
      price: 150,
    ),
    Product(
      id: "3",
      productName: "Chicken Biriyani",
      price: 80,
    ),
    Product(
      id: "4",
      productName: "Rice",
      price: 40,
    ),
    Product(
      id: "5",
      productName: "Mandhi",
      price: 120,
    ),
    Product(
      id: "6",
      productName: "Veg Biriyani",
      price: 60,
    ),
    Product(
      id: "7",
      productName: "Chicken Curry",
      price: 40,
    ),
    Product(
      id: "8",
      productName: "Chicken  Noodles",
      price: 130,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 50,
            ),
            ...productList.map(
              (e) => ProductListTile(
                product: e,
              ),
            ),
            SizedBox(
              height: 250,
            )
          ],
        ),
      ),
      floatingActionButton: TotalCounter(),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/cart');
      //   },
      //   label: const Text(
      //     "Cart",
      //     style: TextStyle(fontSize: 16),
      //   ),
      //   icon: const Icon(Icons.shopping_cart_sharp),
      // ),
    );
  }
}
