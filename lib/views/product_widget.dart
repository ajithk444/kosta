import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/productItem.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc.dart';
import 'package:kosta/services/blocs/shoppingcart_event.dart';

class ProductWidget extends StatelessWidget {
  final ProductItem productItem;

  const ProductWidget({Key key, @required this.productItem}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 7.0, right: 7.0),
      child: Material(
        elevation: 0,
        child: InkWell(
          onTap: () {
            addToCart(productItem);
            final snackBar = SnackBar(
              content: Text('${productItem.name} ajouté dans votre panier!'),
              duration: Duration(milliseconds: 2000),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Container(
            // padding: EdgeInsets.only(left: 10, right: 20, bottom: 15),
            //height: 400,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 270,
                  width: double.infinity / 2,
                  color: Colors.red.withOpacity(0.2),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(productItem.imgUrl),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    productItem.isNew
                        ? Text(
                            "nouveau".toUpperCase(),
                            style: TextStyle(fontSize: 10),
                          )
                        : Text(" "),
                    Text(
                      productItem.name,
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
                          "${productItem.price} FCFA ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: productItem.selectedColor,
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
                color: productItem.selectedColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
