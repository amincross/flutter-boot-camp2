import 'package:flutter_boot_camp2/product.dart';

class Bag {
  Product? product; //کدوم محصول

  int? color; //چه رنگی

  int? size; //چه سایزی

  int quantity=0; // چه تعدادی

  Bag({
    required this.product,
    required this.color,
    required this.size,
    required this.quantity,
  });

  Bag.fromJson(Map<String, dynamic> json) {
    this.product = Product.fromJson(json["product"]);
    this.color = json['color'];
    this.size = json['size'];
    this.quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if(this.product!=null) {
      data['product'] = this.product!.toJson();
    }

    data['color'] = this.color;
    data['size'] = this.size;
    data['quantity'] = this.quantity;

    return data;
  }




}
