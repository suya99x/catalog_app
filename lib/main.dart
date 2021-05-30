import 'package:catalog_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/MyRoutes.dart';
import 'package:catalog_app/pages/Login_Page.dart';
import 'package:catalog_app/widgets/Themes.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),


      //initialRoute: "/home",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
         MyRoutes.cartRoute: (context) => CartPage(),
    },
    );
  }
}

