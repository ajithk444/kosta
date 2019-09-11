import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/ikonate_icons.dart';
import 'package:kosta/models/product.dart';

import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';

import 'cart_item_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _edit = false;

  @override
  void initState() {
    final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context);
   // _cartBloc.dispatch(LoadProductsInCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            color: Colors.grey,
            icon: Icon(Ikonate.edit),
            onPressed: () {
              setState(() {
                _edit = _edit ? false : true;
              });
            },
          )
        ],
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Ikonate.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Panier", style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: cartBody(_cartBloc),
      bottomNavigationBar: bottomBar(_cartBloc),
    );
  }

  Padding cartBody(ShoppingcartBloc _cartBloc) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: BlocBuilder(
          bloc: _cartBloc,
          builder: (context, state) {
            if (state is CartLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoadedFromStorageState) {
              return productListWidget(state);
            }
            if (state is CartUpdatedState) {
              return productListWidget(state);
            }
            if (state is CartLoadedState) {
              return productListWidget(state);
            }
            if (state is CartIsEmptyState) {
              return Container(
                  child: Center(
                child: Text(
                  "Votre Panier est vide",
                  style: TextStyle(fontSize: 18),
                ),
              ));
            } else {
              return Container(
                color: Colors.black,
              );
            }
          },
        ));
  }

  ListView productListWidget(state) {
    final List<Product> productItemsList = state.cart.products;
    return ListView.builder(
      itemCount: productItemsList.length,
      itemBuilder: (context, index) {
        Product productItem = productItemsList[index];
        return CartItemWidget(
          product: productItem,
          edit: _edit,
        );
      },
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

  bottomBar(ShoppingcartBloc _cartBloc) {
    return Container(
      height: 100.0,
      child: BlocBuilder(
        bloc: _cartBloc,
        builder: (context, state) {
          if (state is CartLoadingState) {
            return Container(
                // color: Colors.red,
                );
          } else if (state is CartLoadedFromStorageState) {
            return bottomBarContent(state);
          } else if (state is CartUpdatedState) {
            return bottomBarContent(state);
          }
          if (state is CartLoadedState) {
            return bottomBarContent(state);
          } else if (state is CartIsEmptyState) {
            return Container(
                // color: Colors.red,
                );
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        },
      ),
    );
  }

  Container bottomBarContent(state) {
    List<Product> products = state.cart.products;
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 0.2))),
      // color: Colors.red[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          cartTotalAmount(products),
          cartBottomBtn(),
        ],
      ),
    );
  }

  cartTotalAmount(List<Product> products) {
    return Container(
      child: Text(
        "Total:  ${returnTotalAmount(products)} fcfa".toUpperCase(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  returnTotalAmount(List<Product> products) {
    double totalAmount = 0;

    for (int i = 0; i < products.length; i++) {
      totalAmount = totalAmount + products[i].price * products[i].quantity;
    }
    return totalAmount.toStringAsFixed(0);
  }

  cartBottomBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.height / 3,
      child: RaisedButton(
        elevation: 1,
        color: Colors.black,
        child: Text(
          "Passer commande".toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
