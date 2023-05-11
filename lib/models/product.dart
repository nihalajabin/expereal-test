import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String? id;
  final String? productName;
  //final int? count;
  final String? description;
  final double? price;

  const Product({
    this.id,
    this.productName,
    //this.count,
    this.description,
    this.price,
  });
  @override
  List<Object?> get props => [
        id,
        productName,
        //count,
        description,
        price,
      ];

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
