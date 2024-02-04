import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boot_camp2/home_page.dart';
import 'package:flutter_boot_camp2/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    storageOperations();
    super.initState();
  }

  void storageOperations() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    List<Product>products=[];

    Product product = new Product(
      id: 123,
      title: "asdasd",
      price: 123123,
      description: "asdasdasdasd",
      category: "Asdasdasd",
      image: "asdkansduawd",
    );

    products.add(product);
    products.add(product);
    products.add(product);
    products.add(product);

    List<String> setOfProducts=products
        .map((item) => json.encode(item).toString())
        .toList();

    String stringOfProduct=json.encode(product).toString();

    prefs.setString("username", "admin");
    prefs.setString("password", "password");
    prefs.setString("product", stringOfProduct);
    prefs.setStringList("products", setOfProducts);

    ////////////



    String u1 = prefs.getString("username") ?? "empty";
    String p1 = prefs.getString("password") ?? "empty";
    String productFromStorage = prefs.getString("product") ?? "empty";
    List<String> prodList = prefs.getStringList("products")??[];

 /*   print(u1);
    print(p1);
    print(productFromStorage);
    print(prodList);*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/ic_splash.jpg"))),
      child: Column(
        children: [
          Expanded(child: Container()),
          Text(
            "VALLEY",
            style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(
                Icons.arrow_right_alt_rounded,
                size: 46,
              ),
              backgroundColor: Color(0xFFC06D59),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    ));
  }
}
