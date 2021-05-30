import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/Themes.dart';
import 'package:catalog_app/widgets/home_widgets/Catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/Catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';

import '../MyRoutes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //to load animation of progess circular && to fix error listview
    await Future.delayed((Duration(seconds: 2)));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
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
    //final itemlist=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      //if not using velocityx theme.of(context).cardcolor,
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart,
        color: Colors.white,
        ),
        backgroundColor: context.theme.buttonColor,
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






