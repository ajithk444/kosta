import 'package:equatable/equatable.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShoppingcartState extends Equatable {
  ShoppingcartState([List props = const <dynamic>[]]) : super(props);
}

class CartLoadingState extends ShoppingcartState {
  @override
  String toString() => 'State: Product from cart Loading';
}

class CartLoadedState extends ShoppingcartState {
  final Cart cart;

  CartLoadedState([this.cart = const Cart(products: [])]) : super([cart]);
  @override
  String toString() => 'CartItemsLoaded Loaded';
}

class CartLoadedFromStorageState extends ShoppingcartState {
  final Cart cart;
  CartLoadedFromStorageState([this.cart = const Cart(products: [])])
      : super(cart.products);
  @override
  String toString() => 'CartItemsLoaded Loaded';
}

class CartUpdatedState extends ShoppingcartState {
  final Cart cart;

  //List<Product> products = cart.products;
  CartUpdatedState(this.cart) : super([cart]);
  @override
  String toString() => 'State: Cart Updated State';
}

class CartIsEmptyState extends ShoppingcartState {
  @override
  String toString() => 'State: Cart Empty';
}

class ProductDeletedFromCartState extends ShoppingcartState {
  ProductDeletedFromCartState() : super([]);
  @override
  String toString() => 'State: Product Deleted ';
}

class CartErrorState extends ShoppingcartState {
  @override
  String toString() => 'items Not Loaded error ';
}
