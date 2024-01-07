import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Color buttonTextColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Text("Sign UP!"),
              Text("Please fill all fields"),

              SizedBox(height: 50),

              Container(
                color: Colors.grey,
                width: 250,
                child: Column(
                  children: [Text("Name: "), TextField()],
                ),
              ),

              SizedBox(height: 80),

              Container(
                color: Colors.grey,
                width: 250,
                child: Column(
                  children: [Text("Family: "), TextField()],
                ),
              ),

              SizedBox(height: 80),

              Container(
                color: Colors.grey,
                width: 250,
                child: Column(
                  children: [Text("Age: "), TextField()],
                ),
              ),

              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Register")),
                  Expanded(child: Container()),
                  ElevatedButton(onPressed: () {}, child: Text("cancel")),
                ],
              )
            ],
          )),
    );
  }
}
