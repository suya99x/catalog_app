import 'package:catalog_app/modals/cart.dart';
import 'package:catalog_app/modals/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    //set cart.catalog to catalog
    cart.catalog = catalog;
  }
}
