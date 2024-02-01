import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boot_camp2/product.dart';
import 'package:http/http.dart' as http;

import 'show_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {

  List<String> categories = [];
  List<Product> productList = [];

  int selectedCategoryIndex = -1;

  @override
  void initState() {
    getApiCategories();
    getApiProducts();
    super.initState();
  }

  getApiCategories() async {
    String url = "https://fakestoreapi.com/products/categories";

    var result = await http.get(Uri.parse(url));

    categories = (jsonDecode(result.body) as List)
        .map((data) => data.toString())
        .toList();

    setState(() {});
  }

  getApiProducts() async {
    String url = "https://fakestoreapi.com/products";

    var result = await http.get(Uri.parse(url));

    productList = (jsonDecode(result.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(Icons.list, color: Colors.black),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 12),
          Icon(Icons.card_travel, color: Colors.black),
          SizedBox(width: 20)
        ],
      ),
      bottomNavigationBar: Container(
        width: screenSize.width,
        height: 50,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.card_travel,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        margin: EdgeInsets.all(12),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your New Style",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              width: screenSize.width,
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedCategoryIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: (index == selectedCategoryIndex) ? Colors.black : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        categories[index],
                        style: TextStyle(color: (index == selectedCategoryIndex) ? Colors.white : Colors.black),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            ),
            Container(
              width: screenSize.width,
              height: 450,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(productList.length, (index) {
                  Product currentItem = productList[index];

                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowProductPage(productId: currentItem.id??1)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(currentItem.image ?? "", width: (screenSize.width / 2) - 30, height: 130),

                        Row(children: [
                          SizedBox(width: 8),
                          Text("\$"+(currentItem.price ?? 0.0).toString()),
                          Expanded(child: Container()),
                          Icon(Icons.favorite_border),
                          SizedBox(width: 8),
                        ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),



                        Text(currentItem.title ?? "Empty",overflow: TextOverflow.ellipsis,maxLines: 1,)
                      ],
                    ),
                  );
                }),
              ),
            )

            /*Container(
              width: screenSize.width,
              height: 400,
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context,index){

                  Product currentItem=productList[index];

                  return Row(
                    children: [
                      Image.network(currentItem.image??"",width: 50,height: 50),
                      Text(currentItem.title??""),
                      Text((currentItem.price??0.0).toString()),

                    ],
                  );

                },
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
