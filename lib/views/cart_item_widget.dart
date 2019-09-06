import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/utils.dart';

import '../theme.dart';

class CartItemWidget extends StatefulWidget {
  final Product product;
  final bool edit;

  CartItemWidget({Key key, @required this.product, this.edit = false})
      : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context);

    addToCart(Product product) {
      _cartBloc.dispatch(AddProductToCart(product: product));
      /* _cartBloc.dispatch(LoadProducts()); */
    }

    removeFromCart(Product product) {
      _cartBloc.dispatch(RemoveProductFromCart(product: product));
    }

    return Row(
      children: <Widget>[
        widget.edit ? editOptionWidget(removeFromCart) : Container(),
        Expanded(
          flex: 8,
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                setState(() {
//widget.edit = widget.edit ? false :true;
                });
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 20, bottom: 15),
                      height: 200,
                      //color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 120,
                            color: Colors.red.withOpacity(0.2),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(widget.product.imgUrl),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  widget.product.name,
                                  style: kProductName,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.product.price.toStringAsFixed(0),
                                  style: kProductPrice,
                                ),
                                footer()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Expanded editOptionWidget(removeFromCart(Product product)) {
    return Expanded(
      flex: 1,
      // fit: FlexFit.loose,
      child: Container(
        height: 200,
        // color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            iconBtn(
              Colors.red,
              Icons.delete,
              widget.product,
              () {
                removeFromCart(widget.product);
              },
            ),
            iconBtn(
                Colors.grey, Icons.favorite_border, widget.product, null)
          ],
        ),
      ),
    );
  }

  footer() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //color
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "M",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 45),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: HexColor(widget.product.selectedColor),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Qte:",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: widget.product.quantity.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  IconButton iconBtn(
      Color color, IconData icon, Product item, VoidCallback onPressed) {
    return IconButton(
      color: color,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
