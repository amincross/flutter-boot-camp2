import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boot_camp2/product.dart';
import 'package:http/http.dart' as http;

class ShowProductPage extends StatefulWidget {
  int productId;

  ShowProductPage({required this.productId});

  @override
  State<ShowProductPage> createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
  Product? newProduct = null;

  int size = 1; //1=small , 2= medium , 3=large
  int color = 1; //1=red , 2=blue , 3=yellow

  @override
  void initState() {
    getProductById(widget.productId);
    super.initState();
  }

  void getProductById(int productId) async {
    String url = "https://fakestoreapi.com/products/" + productId.toString();

    var result = await http.get(Uri.parse(url));

    newProduct = Product.fromJson(jsonDecode(result.body));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: (newProduct == null)
            ? SizedBox(width: 50, height: 50, child: CircularProgressIndicator())
            : Column(
                children: [
                  Stack(children: [
                    Image.network(
                      newProduct!.image ?? "",
                      width: screenSize.width,
                      height: 350,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          Icon(Icons.favorite_border),

                        ],
                      ),
                    )
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        newProduct!.title.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "\$" + (newProduct!.price ?? 0.0).toString(),
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  Text(
                    newProduct!.description ?? "",
                    maxLines: 5,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Size", style: TextStyle(color: Colors.black, fontSize: 24)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  size = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: (size == 1) ? Colors.black : Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: Text(
                                    "S",
                                    style: TextStyle(color: (size == 1) ? Colors.white : Colors.black),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    size = 2;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: (size == 2) ? Colors.black : Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Text("M", style: TextStyle(color: (size == 2) ? Colors.white : Colors.black)),
                                  )),
                              InkWell(
                                  onTap: () {
                                    size = 3;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: (size == 3) ? Colors.black : Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Text("L", style: TextStyle(color: (size == 3) ? Colors.white : Colors.black)),
                                  ))
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Color", style: TextStyle(color: Colors.black, fontSize: 24)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  color = 1;
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: Visibility(visible: (color == 1), child: Icon(Icons.check, color: Colors.white)),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    color = 2;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Visibility(visible: (color == 2), child: Icon(Icons.check, color: Colors.white)),
                                  )),
                              InkWell(
                                  onTap: () {
                                    color = 3;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Visibility(visible: (color == 3), child: Icon(Icons.check, color: Colors.white)),
                                  )),
                            ],
                          ),


                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: screenSize.width-50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      "+ add to bag",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
