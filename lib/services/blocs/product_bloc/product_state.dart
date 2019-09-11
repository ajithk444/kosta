import 'package:equatable/equatable.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductState extends Equatable {
  ProductState([List props = const <dynamic>[]]) : super(props);
}

class ProductLoadedState extends ProductState {
  Product product;
  ProductLoadedState([this.product]) : super([product]);
  @override
  String toString() => 'State: ProductLoaded  ';
}

class ProductNotLoadedState extends ProductState {
  @override
  String toString() => 'State: error Product Not Loaded  ';
}

/* Relationship with the cart State */
class ProductAddedToCartState extends ProductState {
 
  @override
  String toString() => 'State: Poduct Added To Dart';
}
/* class ProductAddedToCartState extends ProductState {
  final Cart cart;

  ProductAddedToCartState([this.cart = const Cart(products: [])])
      : super([cart]);
  @override
  String toString() => 'State: Poduct Added To Dart';
} */

class ProductNotAddedState extends ProductState {
  @override
  String toString() => 'State: error Product Not Added to cart ';
}
