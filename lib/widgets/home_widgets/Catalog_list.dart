import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/pages/Home_Detail_Page.dart';
import 'Catalog_image.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile //checking if web or mobile for view
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true, //mathi exapnded list lai fit garna
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog1 = CatalogModel.items[index]; //same thing
              //final catalog1 = CatalogModel.getByPosition(index);
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog1,
                              ))),
                  child: CatalogItem(catalogreq: catalog1));
            },
          )
        : ListView.builder(
            shrinkWrap: true, //mathi exapnded list lai fit garna
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog1 = CatalogModel.items[index]; //same thing
              //final catalog1 = CatalogModel.getByPosition(index);
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(
                                catalog: catalog1,
                              ))),
                  child: CatalogItem(catalogreq: catalog1));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalogreq;
// why assert return itemview null send na bhako check garna
//production ma assert halnu pardaina
  const CatalogItem({Key key, @required this.catalogreq})
      : assert(catalogreq != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        //hero for animation key is used to link both pages should have same key
        //hero tag always string
        Hero(
            tag: Key(catalogreq.id.toString()),
            child: CatalogImage(image: catalogreq.image)),
        Expanded(
            child: Column(
          children: [
            //sadai text paxi x12 or lg
            catalogreq.name.text.lg.color(context.accentColor).bold.make(),
            //caption style light color
            catalogreq.desc.text.textStyle(context.captionStyle).make(),
            SizedBox(
              height: 15,
            ), //or 10.heightbox
            ButtonBar(
              //price ra buy button ma space
              alignment: MainAxisAlignment.spaceBetween,
              //right batra matra padding
              //buttonPadding: Vx.mOnly(right: 16),
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogreq.price}".text.bold.xl.make(),
                AddToCart(catalog: catalogreq)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )
        //py padding 16 rounded border of sqaure if we remove square very big hunxa image
        ).color(context.cardColor).rounded.square(130).make().py16();
  }
}
