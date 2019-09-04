import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/productItem.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc.dart';
import 'package:kosta/services/blocs/shoppingcart_event.dart';

class CartItemWidget extends StatelessWidget {
  final ProductItem productItem;

  const CartItemWidget({Key key, @required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context);

    addToCart(ProductItem productItem) {
      _cartBloc.dispatch(AddProductItem(productItem: productItem));
      /* _cartBloc.dispatch(LoadProductItems()); */
    }

    removeFromList(ProductItem productItem) {
      _cartBloc.dispatch(RemoveProductItem(productItem: productItem));
    }

    return GestureDetector(
      onTap: () {
        addToCart(productItem);
        final snackBar = SnackBar(
          content: Text('${productItem.name} added to Cart'),
          duration: Duration(milliseconds: 550),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 20, bottom: 15),
        height: 140,
        //color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 160,
              width: 120,
              color: Colors.red.withOpacity(0.2),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(productItem.imgUrl),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productItem.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "FCFA 5000",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  footer()
                ],
              ),
            )
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
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: productItem.selectedColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text("M"),
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
                            text: productItem.quantity.toString(),
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
}
