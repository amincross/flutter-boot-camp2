import 'package:flutter/material.dart';
import 'package:flutter_boot_camp2/home_page.dart';

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

                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

              },
              child: Icon(Icons.arrow_right_alt_rounded,size: 46,),
              backgroundColor: Color(0xFFC06D59),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    ));
  }
}
