import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kosta/models/productItem.dart';
import 'package:kosta/services/repository/cartRepository.dart';
import './shoppingcart_bloc_barrel.dart';

class ShoppingcartBloc extends Bloc<ShoppingcartEvent, ShoppingcartState> {
  CartRepository _cartRepository;

  ShoppingcartBloc({CartRepository cartRepository})
      : assert(cartRepository != null),
        _cartRepository = cartRepository;

  @override
  ShoppingcartState get initialState => CartEmptyState();

  @override
  Stream<ShoppingcartState> mapEventToState(
    ShoppingcartEvent event,
  ) async* {
    if (event is LoadProductItems) {
      yield* _mapLoadProductItemToState();
    }
    if (event is AddProductItem) {
      yield* _mapAddProductItemToState(event.productItem);
    } else if (event is RemoveProductItem) {
      yield* _mapRemoveProductItemToState(event.productItem);
    }
  }

  Stream<ShoppingcartState> _mapLoadProductItemToState() async* {
    try {
      List<ProductItem> productItemsList;
      productItemsList = _cartRepository.productItemsList;

      if (productItemsList.length == 0) {
        yield CartEmptyState();
      } else if (productItemsList.length == null) {
        yield CartErrorState();
      } else {
        yield CartItemsLoadedState(productItemsList);
      }
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapAddProductItemToState(ProductItem item) async* {
    try {
      List<ProductItem> productItemsList;
      productItemsList = _cartRepository.productItemsList;
      _cartRepository.addToList(item);
      yield CartItemsLoadedState(productItemsList);

      print("the item is $item");
      print("the item is ${_cartRepository.productItemsList}");
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapRemoveProductItemToState(
      ProductItem item) async* {
    try {
      _cartRepository.removeFromList(item);
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }
}
