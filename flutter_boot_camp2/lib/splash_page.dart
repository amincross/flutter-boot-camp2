import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          margin: EdgeInsets.only(left: 36,right: 36),

      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 50),

          Align(
            alignment: Alignment.center,
              child: Text("SignUP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),)),

          Text("UserName",style: TextStyle(color: Colors.white,fontSize: 16),),
          TextField(),

          SizedBox(height: 25),

          Text("Email",style: TextStyle(color: Colors.white,fontSize: 16),),
          TextField(),

          SizedBox(height: 25),

          Text("Password",style: TextStyle(color: Colors.white,fontSize: 16),),
          TextField(),


          SizedBox(height: 25),
          Text("Confirm Passwrod",style: TextStyle(color: Colors.white,fontSize: 16),),
          TextField(),

          SizedBox(height: 25),

          Container(
            width: size.width,
              child: ElevatedButton(onPressed: (){}, child: Text("SignUP"))),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(width: 150,height: 1,color: Colors.black),
              Text("Or Sign Up With"),
              Container(width: 150,height: 1,color: Colors.black),

            ],
          ),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(color: Colors.greenAccent,width: 100,height: 50,child: Icon(Icons.abc)),

              Container(color: Colors.greenAccent,width: 100,height: 50,child: Icon(Icons.account_box_rounded)),

              Container(color: Colors.greenAccent,width: 100,height: 50,child: Icon(Icons.accessible_rounded)),
            ],
          )

        ],
      ),
    ));
  }
}
