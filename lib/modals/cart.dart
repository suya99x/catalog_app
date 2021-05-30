import 'package:catalog_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {
  // catalog field
  CatalogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // Remove Item

//   void remove(Item item) {
//     _itemIds.remove(item.id);
//   }
}
//this does addtion
class AddMutation extends VxMutation<MyStore> {
  final Item item;
  //final item id;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
    //store.cart._itemIds.add(id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  //final item id;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
    //store.cart._itemIds.add(id);
  }
}