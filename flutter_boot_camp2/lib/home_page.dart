import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        leading: Icon(Icons.list,color: Colors.black),

        actions: [
          Icon(Icons.search,color: Colors.black,),
          SizedBox(width: 12),
          Icon(Icons.card_travel,color: Colors.black),
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
        color: Colors.white,
      ),
    );
  }
}
