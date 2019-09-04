import 'package:equatable/equatable.dart';
import 'package:kosta/models/productItem.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShoppingcartEvent extends Equatable {
  ShoppingcartEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadProductItems extends ShoppingcartEvent {
  @override
  String toString() => 'Load all product Items';
}

class AddProductItem extends ShoppingcartEvent {
  final ProductItem productItem;

  AddProductItem({this.productItem}) : assert(productItem != null);

  @override
  String toString() => 'Add product Item';
}

class RemoveProductItem extends ShoppingcartEvent {
  final ProductItem productItem;

  RemoveProductItem({this.productItem}) : assert(productItem != null);

  @override
  String toString() => 'Remove product Item';
}
