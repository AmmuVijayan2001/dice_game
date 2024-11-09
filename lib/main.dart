import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int n1 = 1;
  int n2 = 2;
  String msg='';
  void Tap() {
    setState(() {
      n1 = Random().nextInt(6) + 1;
      n2 = Random().nextInt(6) + 1;
      if (n1 == n2) {
        msg='';
        showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              backgroundColor: Colors.lightGreen,
              content: Text(
                'Bravo! 🏆 🌟',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }else{
        msg="Try again";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Mystic Dice",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35),
                child: Text(
                  "PUT YOUR LUCK TO THE TEST !",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              ),
              if(msg.isNotEmpty)
                Container(child: Text("Try Again !!",style: TextStyle(color: Colors.red,fontSize: 30),),),
                
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/$n1.jpg'),
                          ),
                            border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: Offset(8, 8))
                          ]),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/$n2.jpg'),
                          ),
                           border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: Offset(8, 8))
                          ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: Center(
                  child: GestureDetector(
                    onTap: Tap,
                    child: Container(
                      child: Center(
                          child: Text(
                        "Spin the Dice!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                      height: 70,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
