import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/Catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/Catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../MyRoutes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1st method
  //var url =Uri.https(
  //   'api.jsonbin.io',
  //    '/b/604dbddb683e7e079c4eefd3', {'q': '{http}'});
//or 2nd method 
final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //to load animation of progess circular && to fix error listview
    await Future.delayed((Duration(seconds: 2)));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    //1st method
    // final response =await http.get(url);
    //2nd method
     final response =await http.get(Uri.parse(url));
    final catalogJson = response.body;
    //print(catalogjson); prints all json data use breakpoint to check(leftclick on line no) {...}
    // we cant load object directly so we decode to get object in dynamic format .ie key,value in map
    final decodeData = jsonDecode(catalogJson);
    //so no we need to map
    var productData = decodeData["products"];
    //item to convert into list
    //  List<Item> list = List.from(productData)
    //      .map<Item>((item) => Item.fromMap(item))
    //      .toList(); or
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    //final itemlist=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      //if not using velocityx theme.of(context).cardcolor,
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
            backgroundColor: context.theme.buttonColor,
          ).badge(
              color: Vx.red500,
              size: 20,
              count: _cart.items.length,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.accentColor,
              ));
        },
      ),
      body: SafeArea(
        //mathi ra talako like battery nav button
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py(16).expand()
              else
                CircularProgressIndicator().centered().expand(),
              //Expanded(child: Center(child: CircularProgressIndicator()))
            ],
          ).px(16),
        ),
      ),
    );
  }
}
