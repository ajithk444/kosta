import 'package:flutter/material.dart';

class ProductItem {
  int id;
  String name;
  String imgUrl;
  String brand;
  double price;
  Color selectedColor;
  int quantity;

  ProductItem({
    @required this.id,
    @required this.name,
    @required this.brand,
    @required this.imgUrl,
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
}

List<ProductItem> productItemsList = [
  ProductItem(
    id: 1,
    name: "Beach BBQ Burger",
    brand: "Las Vegas brand",
    price: 14.49,
    selectedColor: Colors.black,
    imgUrl:
        "https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg",
  ),
  ProductItem(
    id: 2,
    name: "Kick Ass Burgers",
    brand: "Dudleys",
    price: 11.99,
    selectedColor: Colors.green,
    imgUrl:
        "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  ProductItem(
    id: 3,
    name: "Supreme Pizza Burger",
    brand: "Golf Course",
    price: 8.49,
    selectedColor: Colors.red,
    imgUrl: "https://static.food2fork.com/burger53be.jpg",
  ),
  ProductItem(
    id: 4,
    name: "Chilly Cheeze Burger",
    brand: "Las Vegas brand",
    price: 14.49,
    selectedColor: Colors.yellow,
    imgUrl: "https://static.food2fork.com/36725137eb.jpg",
  ),
  ProductItem(
    id: 5,
    name: "Beach BBQ Burger",
    brand: "Las Vegas brand",
    price: 14.49,
    selectedColor: Colors.orange,
    imgUrl: "https://static.food2fork.com/turkeyburger300x200ff84052e.jpg",
  ),
  ProductItem(
    id: 6,
    name: "Beach BBQ Burger",
    brand: "Las Vegas brand",
    price: 14.49,
    selectedColor: Colors.blueAccent,
    imgUrl:
        "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
];
