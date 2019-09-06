import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductState extends Equatable {
  ProductState([List props = const <dynamic>[]]) : super(props);
}

class InitialProductState extends ProductState {}
