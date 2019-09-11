import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/bloc_delegate.dart';

import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/blocs/product_bloc/product_bloc_barrel.dart';
import 'package:kosta/services/repository/cartRepository.dart';

import 'package:kosta/views/app_Layout.dart';

import 'package:kosta/views/cart_page.dart';
import 'package:bloc/bloc.dart';

import 'models/cart.dart';

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate(
    await HydratedBlocStorage.getInstance(),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CartRepository _cartRepository = CartRepository();

  ShoppingcartBloc _cartBloc;
  ProductBloc _productBloc;
  List<Product> _cartProductFromStorage;
  @override
  void initState() {
    print("this is cartRepo before ${_cartRepository.productList}");
    _productBloc = ProductBloc(cartRepository: _cartRepository);
    _cartBloc = ShoppingcartBloc(
      cartRepository: _cartRepository,
      productBloc: _productBloc,
    );

    _cartProductFromStorage = _cartBloc.currentState.props.isEmpty ? [] : _cartBloc.currentState.props;
    _cartRepository.productList = _cartProductFromStorage;
    print("current state is ${_cartBloc.currentState.toString()}");
    print("this is props[0] ${_cartBloc.currentState.props}");
    print("this is cartRepo after ${_cartRepository.productList}");

    super.initState();
  }

  @override
  void dispose() {
    _cartBloc.dispose();
    _productBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingcartBloc>(
          builder: (context) => _cartBloc,
        ),
        BlocProvider<ProductBloc>(
          builder: (context) => _productBloc,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kosta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppLayout(),
        routes: <String, WidgetBuilder>{
          '/cart': (BuildContext context) => CartPage(),
        },
      ),
    );
  }
}
