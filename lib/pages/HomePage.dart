import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catalog App'),
      ),
      body: Text('welcome to home page'),
      drawer: MyDrawer(),
    );
  }
}



