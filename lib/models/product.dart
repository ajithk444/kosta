import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  String description;
  String imgUrl;
  String brand;
  double price;
  bool isNew;
  String selectedColor;
  int quantity;

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.brand,
    @required this.imgUrl,
    this.isNew = false,
    @required this.price,
    @required this.selectedColor,
    this.quantity = 1,
  });

  incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  decrementQuantity() {
    this.quantity = this.quantity - 1;
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

class ProductList {
  final List<Product> products;

  ProductList({@required this.products});
}
