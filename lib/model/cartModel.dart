

class CartModel {
  String name, image,price;
  int quantity;


  CartModel({this.name, this.image,this.price,this.quantity});

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price':price,
      'quantity':quantity,
    };
  }
}