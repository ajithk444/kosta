import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/productItem.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc_barrel.dart';

import 'cart_item_widget.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.only(top: 15),
          child: BlocBuilder(
            bloc: _cartBloc,
            builder: (context, state) {
              if (state is CartItemsLoadedState) {
                final List<ProductItem> productItemsList =
                    state.productItemsList;
                return ListView.builder(
                  itemCount: productItemsList.length,
                  itemBuilder: (context, index) {
                    ProductItem productItem = productItemsList[index];
                    return CartItemWidget(productItem: productItem);
                  },
                );
              }
              if (state is CartEmptyState) {
                return Container(
                  color: Colors.red,
                );
              }
            },
          )),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Panier",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget emptyCartWidget() {
    return Center(
      child: Text(
        "Votre panier est vide pour le moment",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
