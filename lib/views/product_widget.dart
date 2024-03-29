import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/blocs/product_bloc/product_bloc_barrel.dart';

import '../utils.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final _cartBloc = BlocProvider.of<ShoppingcartBloc>(context); */
    final _productBloc = BlocProvider.of<ProductBloc>(context);

    addToCart(Product product) {
      _productBloc.dispatch(AddProductToCart(product: product));
      /* _cartBloc.dispatch(LoadProducts()); */
    }

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 7.0, right: 7.0),
      child: Material(
        elevation: 0,
        child: InkWell(
          onTap: () {
            addToCart(product);
            Scaffold.of(context).removeCurrentSnackBar();
            final snackBar = SnackBar(
              content: Text('${product.name} ajouté à votre panier!'),
              duration: Duration(milliseconds: 2000),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Container(
            // padding: EdgeInsets.only(left: 10, right: 20, bottom: 15),
          // height: 900,//400
            width: double.infinity,
           // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                     //height: 100,//250,
                    width: double.infinity,
                    color: Colors.red.withOpacity(0.2),
                    child: FittedBox(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      child: Image.network(product.imgUrl) ??
                          Center(child: Text("KOSTA")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    product.isNew
                        ? Text(
                            "nouveau".toUpperCase(),
                            style: TextStyle(fontSize: 10),
                          )
                        : Text(" "),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${product.price.toStringAsFixed(0)} FCFA",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: HexColor(product.selectedColor),
                            // shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  footer() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: HexColor(product.selectedColor),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
