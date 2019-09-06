import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/cart.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/views/category_page.dart';

class AppLayout extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ShoppingcartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          BlocBuilder(
            bloc: cartBloc,
            builder: (context, state) {
              if (state is ItemAddedState) {
                final List<Product> products = state.cart.products;
                int length = 0;
                for (int i = 0; i < products.length; i++) {
                  length = length + products[i].quantity;
                }
                return cartICon(context, length);
              } else if (state is CartItemsLoadedState) {
                final List<Product> products = state.cart.products;
                int length = 0;
                for (int i = 0; i < products.length; i++) {
                  length = length + products[i].quantity;
                }
                /*  cartBloc.dispatch(LoadProducts()); */
                return cartICon(context, length);
              } else if (state is CartEmptyState) {
                return cartICon(context, 0);
              }
            },
          ),
        ],
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
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

  MaterialButton cartICon(BuildContext context, int length) {
    return MaterialButton(
      height: 1,
      minWidth: 50,
      child: Text(
        length.toString(),
      ),
      color: Colors.lime,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(2),
      onPressed: () {
        if (length > 0) {
          Navigator.of(context).pushNamed('/cart');
        } else {
          return;
        }
      },
    );
  }
}
