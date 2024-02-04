
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boot_camp2/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {

  List<Product>products=[];

  @override
  void initState() {
    getBagProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Bag Page",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: Image.network(products[index].image??""),
            title: Text(products[index].title??"empty"),
            subtitle: Text(products[index].description??"empty"),
            trailing: InkWell(
              onTap: (){
                _deleteBagItem(index);
              },
              child: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }

  void getBagProduct()async {
    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //خواندن لیست رشته
    List<String> prodList = prefs.getStringList("bag")??[];

    //تبدیل لیست رشته به لیست محصول
    products=prodList.map((item) => Product.fromJson(json.decode(item))).toList();

    setState(() {

    });
  }

  void _deleteBagItem(int index)async {
    products.removeAt(index);

    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //تبدیل لیست نهایی به لیست رشته
    List<String> setOfProducts=products
        .map((item) => json.encode(item).toString())
        .toList();

    //ذخیره لیست رشته در حافظه
    prefs.setStringList("bag", setOfProducts);

    getBagProduct();
  }
}
