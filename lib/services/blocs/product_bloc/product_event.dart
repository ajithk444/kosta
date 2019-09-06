import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent extends Equatable {
  ProductEvent([List props = const <dynamic>[]]) : super(props);
}
