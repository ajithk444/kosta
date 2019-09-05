import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/productItem.dart';
import 'package:kosta/services/blocs/shoppingcart_bloc_barrel.dart';
import 'package:kosta/views/product_widget.dart';

import 'cart_item_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ShoppingcartBloc>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 370,
          backgroundColor: Colors.white,
          floating: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,

              background: Column(
            children: <Widget>[
              header(),
              sectionOptions(),
            ],
          )),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            childAspectRatio: .59,
          ),
          delegate: SliverChildListDelegate(<Widget>[
            for (var productItem in productItemsList)
              Builder(
                builder: (context) {
                  return ProductWidget(
                    productItem: productItem,
                  );
                },
              ),
          ]),
        )
      ],
    );
  }

  Container sectionOptions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //  height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: "50 ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "articles",
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
          ),
          Row(
            children: <Widget>[
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.list),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.sort),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Container header() {
    return Container(
      height: 300,
      width: double.infinity,
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            //color: Colors.red.withOpacity(0.2),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset("assets/images/go.jpg"),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(100),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nouvelle collection".toUpperCase(),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text("Cheap thrills",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text("The Personal, The Inimitable",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
