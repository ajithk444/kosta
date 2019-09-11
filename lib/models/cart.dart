import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kosta/models/product.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart extends Equatable{
  final List<Product> products;

  const Cart({@required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}

Cart cartItems = Cart(products: myProducts);
List<Product> myProducts = [
  Product(
    id: 1,
    name: "Colored utility vest",
    price: 15000,
    description:
        "Basic long sleeve shirt with front pockets, a Kent collar and button-up front. Available in a range of colors.",
    brand: "Las Vegas brand",
    isNew: true,
    selectedColor: '#16a085',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9771/502/800/9771502800_2_1_8.jpg?t=1565625488626&imwidth=900",
  ),
  Product(
    id: 2,
    name: "Black utility vest with pockets",
    description:
        "Black utility vest with patch pockets and zipper fastening. Made of 100% cotton.",
    brand: "Dudleys",
    price: 15200,
    selectedColor: '#e74c3c',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9771/500/800/9771500800_2_2_8.jpg?t=1564403302296&imwidth=900",
  ),
  Product(
    id: 3,
    name: "Shirt with front pockets",
    description:
        "Basic long sleeve shirt with front pockets, a Kent collar and button-up front. Available in a range of colors.",
    brand: "Golf Course",
    price: 23500,
    isNew: true,
    selectedColor:'#27ae60',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9474/526/250/9474526250_2_1_8.jpg?t=1565619984992&imwidth=900",
  ),
  Product(
    id: 4,
    name: "Ripstop cargo pants",
    description:
        "Cargo pants in ripstop fabric with belt loops, side flap pockets, adjustable drawstring cuffs and zip fly and top button fastening. Available in a range of colors. ",
    brand: "Las Vegas brand",
    price: 12000,
    selectedColor: '#d35400',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9671/501/800/9671501800_2_1_8.jpg?t=1565621313001&imwidth=900",
  ),
  Product(
    id: 5,
    name: "White “Allowed” print T-shirt",
    description:
        "White short sleeve T-shirt with an all-over contrast “Allowed” slogan print and a crew neck. Made of 100% cotton. ",
    brand: "Las Vegas brand",
    price: 50000,
    isNew: true,
    selectedColor: '#16a085',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9231/512/250/9231512250_2_2_8.jpg?t=1564402497249&imwidth=900",
  ),
  Product(
    id: 7,
    name: "Oversize short raglan sleeve T-shirt",
    description:
        "Short raglan sleeve oversize T-shirt with a crew neck. Made of 100% cotton. ",
    brand: "Las Vegas brand",
    price: 9500,
    selectedColor: '#8e44ad',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9242/597/805/9242597805_2_1_8.jpg?t=1565619787224&imwidth=900",
  ),
  Product(
    id: 8,
    name: "Striped T-shirt with contrasting trim",
    description:
        "Short sleeve stripe print T-shirt with a crew neck and contrasting trim. Made of 100% cotton. ",
    brand: "Las Vegas brand",
    price: 14000,
    selectedColor: '#f39c12',
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9230/574/420/9230574420_2_1_8.jpg?t=1561643061179&imwidth=900",
  ),
  Product(
      id: 9,
      name: "Black sneakers with coordinates detail",
      description:
          "Black lace-up sneakers with coordinates detail on the side. ",
      brand: "Las Vegas brand",
      price: 30500,
      selectedColor: '#16a085',
      isNew: true,
      imgUrl:
          "https://static.pullandbear.net/2/photos//2019/I/1/2/p/7234/012/040/7234012040_2_1_8.jpg?t=1566565634278&imwidth=900"),
  Product(
      id: 10,
      name: "Oversize short raglan sleeve T-shirt",
      description:
          "Short raglan sleeve oversize T-shirt with a crew neck. Made of 100% cotton. ",
      brand: "Las Vegas brand",
      price: 40000,
      selectedColor: '#2980b9',
      imgUrl:
          "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9242/597/800/9242597800_2_4_8.jpg?t=1565619675952&imwidth=900"),
  Product(
    id: 11,
    name: "End of Story print T-shirt",
    description:
        "White short sleeve T-shirt with a crew neck, a printed slogan on the chest and a label stitched onto the hem. Made of 100% cotton. ",
    brand: "Las Vegas brand",
    price: 45500,
    selectedColor: '#7f8c8d',
    isNew: true,
    imgUrl:
        "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9242/524/250/9242524250_2_2_8.jpg?t=1562053683150&imwidth=900",
  ),
];
