import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bag.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {


  List<Bag> bags = [];
  double totalPrice=0;

  @override
  void initState() {
    getBagProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bag Page",
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height*0.7,
            child: ListView.builder(
              itemCount: bags.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(bags[index].product!.image ?? ""),
                  title: Text(bags[index].product!.title ?? "empty"),
                  subtitle: Column(
                    children: [
                      Text(
                        bags[index].product!.description ?? "empty",
                        maxLines: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(getColorName(bags[index].color ?? -1)),
                          Text(getSizeName(bags[index].size ?? -1)),
                          Text("Count: " + bags[index].quantity.toString()),
                          Text("Price: " + (bags[index].product!.price!).toString()),

                          InkWell(
                            onTap: (){
                              _addProductCount(bags[index]);
                            },
                            child: Icon(Icons.add),
                          ),

                          InkWell(
                            onTap: (){
                              _removeProductCount(bags[index]);
                            },
                            child: Icon(Icons.remove),
                          ),

                        ],
                      )
                    ],
                  ),
                  trailing: InkWell(
                    onTap: (){
                      _deleteBagItem(index);
                    },
                    child: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height*0.2,
            child: Row(
              children: [
                Text("Total Price "),
                Text("\$"+totalPrice.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getBagProduct() async {
    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //خواندن لیست رشته
    List<String> bagList = prefs.getStringList("bag") ?? [];

    //تبدیل لیست رشته به لیست محصول
    bags = bagList.map((item) => Bag.fromJson(json.decode(item))).toList();

    totalPrice=0;
    bags.forEach((element) {
      totalPrice+=(element.quantity * element.product!.price!);
    });

    setState(() {});
  }

  void _deleteBagItem(int index) async {
    bags.removeAt(index);

    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //تبدیل لیست نهایی به لیست رشته
    List<String> setOfProducts = bags.map((item) => json.encode(item).toString()).toList();

    //ذخیره لیست رشته در حافظه
    prefs.setStringList("bag", setOfProducts);

    getBagProduct();
  }

  //1=red , 2=blue , 3=yellow
  String getColorName(int color) {
    if (color == 1) {
      return "RED";
    } else if (color == 2) {
      return "BLUE";
    } else if (color == 3) {
      return "YELLOW";
    } else {
      return "Undefined";
    }
  }

  //1=small , 2= medium , 3=large
  String getSizeName(int size) {
    if (size == 1) {
      return "SMALL";
    } else if (size == 2) {
      return "MEDIUM";
    } else if (size == 3) {
      return "LARGE";
    } else {
      return "Undefined";
    }
  }

  void _addProductCount(Bag bag)async {
    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //خواندن لیست رشته
    List<String> bagList = prefs.getStringList("bag")??[];

    //تبدیل لیست رشته به لیست محصول
    List<Bag>bags=bagList.map((item) => Bag.fromJson(json.decode(item))).toList();

    bags.forEach((element) {
      if(element.product!.id==bag.product!.id){
        element.quantity++;
      }
    });
        //تبدیل لیست نهایی به لیست رشته
    List<String> setOfBags=bags
        .map((item) => json.encode(item).toString())
        .toList();

    //ذخیره لیست رشته در حافظه
    prefs.setStringList("bag", setOfBags);

    getBagProduct();
  }

  void _removeProductCount(Bag bag)async {
    //باز کردن حافظه
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //خواندن لیست رشته
    List<String> bagList = prefs.getStringList("bag")??[];

    //تبدیل لیست رشته به لیست محصول
    List<Bag>bags=bagList.map((item) => Bag.fromJson(json.decode(item))).toList();

    bags.forEach((element) {
      if(element.product!.id==bag.product!.id){
        if(element.quantity>=2) {
          element.quantity--;
        }
      }
    });
    //تبدیل لیست نهایی به لیست رشته
    List<String> setOfBags=bags
        .map((item) => json.encode(item).toString())
        .toList();

    //ذخیره لیست رشته در حافظه
    prefs.setStringList("bag", setOfBags);

    getBagProduct();
  }
}
