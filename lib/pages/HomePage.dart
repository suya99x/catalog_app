import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async {
     final catalogJson= await rootBundle.loadString("assets/files/catalog.json");
     //print(catalogjson); prints all json data use breakpoint to check(leftclick on line no) {...}
     // we cant load object directly so we decode to get object in dynamic format .ie key,value in map
     final decodeData=jsonDecode(catalogJson);
     //so no we need to map
    var productData=decodeData["products"];
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    final itemlist=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catalog App'),
      ),
      //body: Text(context.runtimeType.toString()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          //or CatalogModel.items.length,
          itemCount: itemlist.length,
          itemBuilder: (context, index){
            return ItemWidget(
                item: itemlist[index]);
          },

        ),
      ),
      drawer: MyDrawer(),
    );
  }
}



