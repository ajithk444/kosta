import 'package:flutter/material.dart';
import 'package:kosta/services/blocs/bloc_delegate.dart';
import 'package:kosta/views/app.dart';
import 'package:kosta/views/buzy.dart';
import 'package:kosta/views/cart_page.dart';
import 'package:bloc/bloc.dart';
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kosta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
      routes: <String, WidgetBuilder>{
        '/cart': (BuildContext context) => CartPage(),
        '/buss': (BuildContext context) => Bussy(),
      },
    );
  }
}
