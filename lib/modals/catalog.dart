class CatalogModel {
  static List<Item> items;

//get item ny id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by positon
   Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
// our key is string like id,name in catalog.json so string otherwise dynamic
// facotry help to choose constructor and all final
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      //left side class right side on map json key name
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }
  //to encode json
  toMap() => {
        id: id,
        name: name,
        desc: desc,
        price: price,
        color: color,
        image: image,
      };
}
