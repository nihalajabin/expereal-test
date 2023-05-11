import 'package:equatable/equatable.dart';
import 'package:expereal_test/models/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_item.g.dart';

@JsonSerializable()
class CartItem extends Equatable {
  final Product? product;
  int? count;

  CartItem(this.product, this.count);
  @override
  List<Object?> get props => [product, count];

  addToCart(product) {}

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
