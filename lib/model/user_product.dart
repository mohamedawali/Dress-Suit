class ProductData {
  String? product_id;
  String? user_id;
  String? name;
  String? type;
  String? color;
  String? size;
  String? price;
  List? image;
  String? date;
String? phone;
  ProductData(this.product_id, this.user_id, this.name, this.color, this.size,
      this.price, this.type, this.image, this.date,this.phone);

  Map<String, dynamic> productToMap() {
    return {
      'product_id': product_id,
      'user_id': user_id,
      'name': name,
      'color': color,
      'size': size,
      'price': price,
      'type': type,
      'image': image,
      'date': date,
      'phone':phone
    };
  }

  ProductData.productFromMap(Map<String, dynamic> map) {

    user_id=map['user_id'];
    name = map['name'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
    type = map['type'];
    image = map['image'];
    phone=map['phone'];
  }

  ProductData.productUserFromMap(Map<String, dynamic> map) {
    product_id = map['product_id'];
    name = map['name'];

    image = map['image'];
    date = map['date'];

  }
}
