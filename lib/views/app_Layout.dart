import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/blocs/product_bloc/product_bloc_barrel.dart';
import 'package:kosta/services/blocs/product_bloc/product_state.dart';
import 'package:kosta/views/category_page.dart';

import '../ikonate_icons.dart';

class AppLayout extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ShoppingcartBloc>(context);
    // final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          BlocBuilder(
            bloc: cartBloc,
            builder: (context, state) {
              /*  if (state is ItemAddedState) {
                final List<Product> products = state.cart.products;
                int length = 0;
                for (int i = 0; i < products.length; i++) {
                  length = length + products[i].quantity;
                }
                return cartICon(context, length);
              } else  */

              if (state is CartLoadedFromStorageState) {
                int length = returnQuantityOfProductsInCart(state);
                /*  productBloc.dispatch(LoadProducts()); */
                return cartICon(context, length);
              } else if (state is CartLoadedState) {
                int length = returnQuantityOfProductsInCart(state);
                /*  productBloc.dispatch(LoadProducts()); */
                return cartICon(context, length);
              } else if (state is CartUpdatedState) {
                int length = returnQuantityOfProductsInCart(state);
                /*  productBloc.dispatch(LoadProducts()); */
                return cartICon(context, length);
              } else {
                return cartICon(context, 0);
              }
            },
          ),
        ],
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Ikonate.chevron_left),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
        title: Text(
          "T-shirt",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CategoryPage(),
    );
  }

  int returnQuantityOfProductsInCart(state) {
    final List<Product> products = state.cart.products;
    print(products);
    int length = 0;
    for (int i = 0; i < products.length; i++) {
      length = length + products[i].quantity;
    }
    return length;
  }

  Stack cartICon(BuildContext context, int length) {
    return Stack(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(Ikonate.bag),
            iconSize: 28.0,
            color: Colors.black,
            padding: EdgeInsets.all(2),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ),
        Positioned(
          bottom: 25,
          left: 21,
          child: Text(
            length.toString(),
            style: TextStyle(color: Colors.black, fontSize: 11.0),
          ),
        )
      ],
    );
  }
}
