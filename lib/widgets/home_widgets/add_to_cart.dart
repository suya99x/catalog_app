import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //redraw due to watch on both addmutation and remove mutation
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    //access card for statemgmt .cart from stores
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    //ture "??" or false
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);         
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
