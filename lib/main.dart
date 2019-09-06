import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kosta/models/product.dart';
import 'package:kosta/services/blocs/bloc_delegate.dart';

import 'package:kosta/services/blocs/cart_bloc/shoppingcart_bloc_barrel.dart';
import 'package:kosta/services/repository/cartRepository.dart';

import 'package:kosta/views/app_Layout.dart';

import 'package:kosta/views/cart_page.dart';
import 'package:bloc/bloc.dart';

import 'models/cart.dart';

void main() async {
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

/* void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
} */

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShoppingcartBloc _cartBloc;
  final CartRepository _cartRepository = CartRepository();
  @override
  void initState() {
    _cartBloc = ShoppingcartBloc(cartRepository: _cartRepository);
    super.initState();
  }

  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
        id: 2,
        name: "Black utility vest with pockets",
        description:
            "Black utility vest with patch pockets and zipper fastening. Made of 100% cotton.",
        brand: "Dudleys",
        price: 15200,
        selectedColor: "FFFFF",
        imgUrl:
            "https://static.pullandbear.net/2/photos//2019/I/0/2/p/9771/500/800/9771500800_2_2_8.jpg?t=1564403302296&imwidth=900",
      )
    ];
    Cart cart = Cart(products: products);
    print(cart.toJson());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingcartBloc>(
          builder: (context) => _cartBloc,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kosta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppLayout(),
        routes: <String, WidgetBuilder>{
          '/cart': (BuildContext context) => CartPage(),
        },
      ),
    );
  }
}
