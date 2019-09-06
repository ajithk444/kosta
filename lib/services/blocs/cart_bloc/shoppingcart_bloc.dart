import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/repository/cartRepository.dart';
import './shoppingcart_bloc_barrel.dart';

class ShoppingcartBloc extends HydratedBloc<ShoppingcartEvent, ShoppingcartState> {
  CartRepository _cartRepository;

  ShoppingcartBloc({CartRepository cartRepository})
      : assert(cartRepository != null),
        _cartRepository = cartRepository;

  @override
  ShoppingcartState get initialState {
     
    // Super class (HydratedBloc) will try to get the lastly stored state.
    // If there isn't a stored state (null), return a default WeatherInitial.
    return super.initialState ?? CartEmptyState();
  }

  @override
  Stream<ShoppingcartState> mapEventToState(
    ShoppingcartEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductToState();
    }
    if (event is AddProductToCart) {
      yield* _mapAddProductToCartToState(event.product);
    } else if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductToState(event.product);
    }
  }

  Stream<ShoppingcartState> _mapLoadProductToState() async* {
    try {
      List<Product> productItemsList;
      Cart cart;
      cart = Cart(products: _cartRepository.productItemsList);

      if (productItemsList.length == 0) {
        yield CartEmptyState();
      } else if (productItemsList.length == null) {
        yield CartErrorState();
      } else {
        yield CartItemsLoadedState(cart);
      }
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapAddProductToCartToState(Product item) async* {
    try {
      _cartRepository.addToList(item);
      Cart cart;
      //feed the cart with new cartRepository Product list
      cart = Cart(products: _cartRepository.productItemsList);
      List<Product> products = cart.products;
      yield ItemAddedState(cart);
      if (products.length != 0) {
        yield CartItemsLoadedState(cart);
      } else if (products.length == 0) {
        yield CartEmptyState();
      }

      print("the item is $item");
      print("the item is ${_cartRepository.productItemsList}");
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapRemoveProductToState(Product item) async* {
    try {
      _cartRepository.removeFromList(item);
      Cart cart;
      //feed the cart with new cartRepository Product list
      cart = Cart(products: _cartRepository.productItemsList);
      List<Product> products = cart.products;

      products = _cartRepository.productItemsList;
      yield ItemAddedState(cart);
      yield CartItemsLoadedState(cart);
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  @override
  ShoppingcartState fromJson(Map<String, dynamic> json) {
    try {
      final product = Cart.fromJson(json);
      return CartItemsLoadedState(product);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ShoppingcartState state) {
    if (state is CartItemsLoadedState) {
      return state.cart.toJson();
    } else {
      return null;
    }
  }
}
