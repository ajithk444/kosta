import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/repository/cartRepository.dart';

import 'app_Layout.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ShoppingcartBloc _cartBloc;
  final CartRepository _cartRepository = CartRepository();
  @override
  void initState() {
    _cartBloc = ShoppingcartBloc(cartRepository: _cartRepository);
    super.initState();
  }

  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout();
  }
}
