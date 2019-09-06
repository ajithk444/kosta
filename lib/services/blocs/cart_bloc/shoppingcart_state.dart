import 'package:equatable/equatable.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShoppingcartState extends Equatable {
  ShoppingcartState([List props = const <dynamic>[]]) : super(props);
}

class InitialShoppingcartState extends ShoppingcartState {
  @override
  String toString() => 'Items Loading';
}

class CartItemsLoadedState extends ShoppingcartState {
  final Cart cart;

  //List<Product> products = cart.products;
  CartItemsLoadedState(this.cart) : super([cart]);
  @override
  String toString() => 'CartItemsLoaded Loaded';
}

class CartEmptyState extends ShoppingcartState {
  @override
  String toString() => 'Cart Empty';
}

class ItemAddedState extends ShoppingcartState {
  final Cart cart;

  ItemAddedState([this.cart = const Cart(products: [])]) : super([cart]);
  @override
  String toString() => 'Item Added ';
}

class CartErrorState extends ShoppingcartState {
  @override
  String toString() => 'items Not Loaded error ';
}
