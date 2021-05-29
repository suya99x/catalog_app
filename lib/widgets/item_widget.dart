import 'package:catalog_app/modals/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
// why assert return itemview null send na bhako check garna
//production ma assert halnu pardaina
  const ItemWidget({Key key,@required this.item})
      : assert(item != null ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: (){

        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          //or item.price.toString(),
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
    );
  }
}
