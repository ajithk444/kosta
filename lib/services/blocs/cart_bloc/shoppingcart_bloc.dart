import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/product_bloc/product_bloc.dart';
import 'package:kosta/services/blocs/product_bloc/product_state.dart';
import 'package:kosta/services/repository/cartRepository.dart';
import './shoppingcart_bloc_barrel.dart';

class ShoppingcartBloc
    extends HydratedBloc<ShoppingcartEvent, ShoppingcartState> {
  CartRepository _cartRepository;
  final ProductBloc productBloc;

  StreamSubscription productBlocSubscription;

  ShoppingcartBloc({CartRepository cartRepository, this.productBloc}) {
    assert(cartRepository != null, productBloc != null);
    _cartRepository = cartRepository;
    productBlocSubscription = productBloc.state.listen((state) {
      if (state is ProductAddedToCartState) {
        print("subscription ooooooopened");
        dispatch(UpdateCart());
        print("subscription clooooooooosed");
      }
    }, onDone: () {
      print("dooooone");
    }, onError: (er) {
      print("errrrrrrrrror");
    });
  }

  @override
  ShoppingcartState get initialState {
    // Super class (HydratedBloc) will try to get the lastly stored state.
    // If there isn't a stored state (null), return a default state.
    return super.initialState ?? CartLoadingState();
  }

  @override
  Stream<ShoppingcartState> mapEventToState(
    ShoppingcartEvent event,
  ) async* {
    if (event is LoadProductsInCart) {
      yield* _mapLoadProductToState();
    }
    if (event is UpdateCart) {
      yield* _mapUpdateCartToState();
    } else if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductFromCartToState(event.product);
    }
  }

  Stream<ShoppingcartState> _mapLoadProductToState() async* {
    try {
      Cart cart;
      cart = Cart(products: _cartRepository.productList);
      List<Product> productList = cart.products;
      yield CartLoadedState(cart);
      if (productList.length > 0) {
        yield CartLoadedState(cart);
      } else if (productList.length == 0) {
        yield CartIsEmptyState();
      } else if (productList.length == null) {
        yield CartErrorState();
      }
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapUpdateCartToState() async* {
    try {
      // _cartRepository.addToList(item);
      Cart cart;
      /* fetch and store new productlist from cartRepository into updatedProductList variable */
      List<Product> updatedProductList = _cartRepository.productList;
      //feed the cart with new cartRepository Product list
      cart = Cart(products: updatedProductList);

      yield CartUpdatedState(cart);
      
      if (updatedProductList.length == 0) {
        yield CartIsEmptyState();
      }

      print("the item is $updatedProductList");
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  Stream<ShoppingcartState> _mapRemoveProductFromCartToState(
      Product item) async* {
    try {
      _cartRepository.removeFromList(item);
      Cart cart;
      List<Product> updateProductList = _cartRepository.productList;
      //feed the cart with new cartRepository Product list
      cart = Cart(products: updateProductList);

      yield ProductDeletedFromCartState();
      yield CartUpdatedState(cart);
      if (updateProductList.length == 0) {
        yield CartIsEmptyState();
      }
    } catch (e) {
      yield CartErrorState();
      print(e);
    }
  }

  @override
  ShoppingcartState fromJson(Map<String, dynamic> json) {
    try {
      final cart = Cart.fromJson(json);
      // _cartRepository.productList = cart.products;
      // print(cart.products);
      //this.dispatch(LoadProductsInCart());
      return CartLoadedFromStorageState(cart);
    } catch (_) {
      print(_);
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ShoppingcartState state) {
    if (state is CartLoadedState) {
      return state.cart.toJson();
    } else if (state is CartUpdatedState) {
      return state.cart.toJson();
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    productBlocSubscription.cancel();
    super.dispose();
  }
}
