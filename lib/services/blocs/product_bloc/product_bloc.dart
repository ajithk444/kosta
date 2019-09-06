import 'dart:async';
import 'package:bloc/bloc.dart';
import './product_bloc_barrel.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => InitialProductState();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
