import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosta/models/cart.dart';

import 'package:kosta/services/blocs/product_bloc/product_bloc_barrel.dart';
import 'package:kosta/views/product_widget.dart';

import '../ikonate_icons.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

int _gridCrossAxisCount = 2;
double _gridChildAspectRatio = 0.59;

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    final _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.dispatch(LoadProducts());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _productBloc = BlocProvider.of<ProductBloc>(context);

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
            crossAxisCount: _gridCrossAxisCount,
            crossAxisSpacing: 0,
            mainAxisSpacing: 25,
            childAspectRatio: _gridChildAspectRatio, //.59
          ),
          delegate: SliverChildListDelegate(<Widget>[
            for (var product in myProducts)
              Builder(
                builder: (context) {
                  return ProductWidget(
                    product: product,
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
                icon: Icon(Ikonate.gruid),
                onPressed: () {
                  setState(() {
                    _gridCrossAxisCount = 2;
                    _gridChildAspectRatio = 0.59;
                  });
                },
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Ikonate.stop),
                onPressed: () {
                  setState(() {
                    _gridCrossAxisCount = 1;
                    _gridChildAspectRatio = 0.7;
                  });
                },
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
