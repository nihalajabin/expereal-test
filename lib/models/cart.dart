import 'package:equatable/equatable.dart';
import 'package:expereal_test/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_item.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  final List<Product>? products;

  Cart({
    this.products = const <Product>[],
  });
  @override
  List<Object?> get props => [
        products,
      ];

  Map productQuantity(List<Product>? productList) {
    var quantity = {};
    productList?.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
