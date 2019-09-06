import 'package:equatable/equatable.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShoppingcartEvent extends Equatable {
  ShoppingcartEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadProducts extends ShoppingcartEvent {
  @override
  String toString() => 'Load all product Items';
}

class AddProductToCart extends ShoppingcartEvent {
  final Product product;

  AddProductToCart({this.product}) : assert(product != null);

  @override
  String toString() => 'Add product Item';
}

class RemoveProductFromCart extends ShoppingcartEvent {
  final Product product;

  RemoveProductFromCart({this.product}) : assert(product != null);

  @override
  String toString() => 'Remove product Item';
}
