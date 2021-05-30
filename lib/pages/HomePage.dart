import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

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
    //to load animation of progess circular && to fix error listview
    await Future.delayed((Duration(seconds: 2)));
     final catalogJson= await rootBundle.loadString("assets/files/catalog.json");
     //print(catalogjson); prints all json data use breakpoint to check(leftclick on line no) {...}
     // we cant load object directly so we decode to get object in dynamic format .ie key,value in map
     final decodeData=jsonDecode(catalogJson);
     //so no we need to map
    var productData=decodeData["products"];
    //item to convert into list
    //  List<Item> list = List.from(productData)
    //      .map<Item>((item) => Item.fromMap(item))
    //      .toList(); or
     CatalogModel.items = List.from(productData)
         .map<Item>((item) => Item.fromMap(item))
         .toList();
     setState(() {});
  }

  @override
  Widget build(BuildContext context) {

   //final itemlist=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catalog App'),
      ),
      //body: Text(context.runtimeType.toString()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //to fix null error in getter in lisstview
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //mainaxisspacing spaces from vertical
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
          // itemBuilder: (context, index) => ItemWidget(
          //       item: CatalogModel.items[index]),
          itemBuilder: (context, index){
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridTile(
                header:  Container(
                  child: Text(item.name),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple
                  ),
                  padding: const EdgeInsets.all(16),
                  ),
                footer: Container(
                  child: Text("\$${item.price}"),
                   decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  ),
                child: Image.network(item.image)));
          },
            itemCount: CatalogModel.items.length,

        )
         :Center(//if item not loaded in list view
          child: CircularProgressIndicator(),
        )
      ),
      drawer: MyDrawer(),
  
    );
  }
}



