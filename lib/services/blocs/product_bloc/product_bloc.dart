import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/repository/cartRepository.dart';
import './product_bloc_barrel.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  CartRepository _cartRepository;

  ProductBloc({CartRepository cartRepository}) {
    assert(cartRepository != null);
    _cartRepository = cartRepository;
  }

  @override
  ProductState get initialState {
    // Super class (HydratedBloc) will try to get the lastly stored state.
    // If there isn't a stored state (null), return a default WeatherInitial.
    return super.initialState ?? ProductLoadedState();
  }

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductToState();
    }
    if (event is AddProductToCart) {
      yield* _mapAddProductToCartToState(event.product);
    }
    /* else if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductToState(event.product);
    } */
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    try {
      yield ProductLoadedState();
    } catch (e) {
      yield ProductNotLoadedState();
      print(e);
    }
  }

  Stream<ProductState> _mapAddProductToCartToState(Product product) async* {
    try {
      /* Backend: add product to cartRepository productlist*/
      _cartRepository.addToList(product);
      print("from productbloc ${_cartRepository.productList}");
      /* fetch and store new productlist from cartRepository into updatedProductList variable */
      List<Product> updatedProductList = _cartRepository.productList;

      /* FrontEnd: feed the state cart variable with new cartRepository Productlist */
      Cart frontEndCart = Cart(products: updatedProductList);
      yield ProductAddedToCartState();
      print("RRRRRRAAAAAAAAASSSSSS");
    } catch (e) {
      yield ProductNotAddedState();
      print(e);
    }
  }

  @override
  ProductState fromJson(Map<String, dynamic> json) {
    try {
      final product = Product.fromJson(json);

      return ProductLoadedState(product);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ProductState state) {
    if (state is ProductLoadedState) {
      return state.product.toJson();
    } else {
      return null;
    }
  }
}
