import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/repository/cartRepository.dart';
import 'package:kosta/views/cart_page.dart';
import 'package:kosta/views/category_page.dart';

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
    return BlocProvider<ShoppingcartBloc>(
      builder: (context) => _cartBloc,
      child: AppLayout(),
    );
  }
}
