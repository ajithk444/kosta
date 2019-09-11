import 'package:equatable/equatable.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShoppingcartEvent extends Equatable {
  ShoppingcartEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadProductsInCart extends ShoppingcartEvent {
  @override
  String toString() => 'Load all product Items';
}

class UpdateCart extends ShoppingcartEvent {
  UpdateCart();

  @override
  String toString() => 'Event : Update Cart';
}

class RemoveProductFromCart extends ShoppingcartEvent {
  final Product product;

  RemoveProductFromCart({this.product}) : assert(product != null);

  @override
  String toString() => 'Remove product Item';
}
