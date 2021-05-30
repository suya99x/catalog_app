import 'package:catalog_app/modals/catalog.dart';
import 'package:catalog_app/widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                //price ra buy button ma space
                alignment: MainAxisAlignment.spaceBetween,
                //right batra matra padding
                //buttonPadding: Vx.mOnly(right: 16),
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.purple400.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        //all matlab pressed or not pressed both
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        //button rounded corner
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.make(),
                  ).wh(100,50)
                  //w means with h mean height 
                  //can also use w(context)
                ],
              ).p(32),
      ),
      body: SafeArea(
        bottom: false, // for iphone tala ko ignore garna
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).centered(),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0, //katro arc garne like angle
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP, //top bata concave garxa

              child: Container(
                //containter for description buy and other stuffs
                color: Colors.white,
                width: context.screenWidth,//half ayera fullscreen use garna
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  ],
                ).py64(),//py64 to make sure content doesnot get cut due to arc
              ),
            ))
          ],
        ),
      ),
    );
  }
}
