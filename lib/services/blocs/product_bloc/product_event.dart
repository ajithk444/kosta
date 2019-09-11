import 'package:equatable/equatable.dart';
import 'package:kosta/models/product.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent extends Equatable {
  ProductEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadProducts extends ProductEvent {
  @override
  String toString() => 'Event:';
}

class AddProductToCart extends ProductEvent {
  final Product product;

  AddProductToCart({this.product}) : assert(product != null);

  @override
  String toString() => 'Event: Add product To Cart';
}

class RemoveProductFromCart extends ProductEvent {
  final Product product;

  RemoveProductFromCart({this.product}) : assert(product != null);

  @override
  String toString() => 'Event: Remove product From Cart';
}
