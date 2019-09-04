import 'package:equatable/equatable.dart';
import 'package:kosta/models/productItem.dart';
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
  final List<ProductItem> productItemsList;

  CartItemsLoadedState([this.productItemsList = const []])
      : super([productItemsList]);
  @override
  String toString() => 'CartItemsLoaded Loaded';
}


class CartEmptyState extends ShoppingcartState {
  @override
  String toString() => 'Cart Empty';
}

class CartErrorState extends ShoppingcartState {
  @override
  String toString() => 'items Not Loaded error ';
}