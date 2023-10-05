import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Register%20Screen.dart';
import 'package:project/itemSelected%20Screen.dart';

import 'coffee Screen.dart';
import 'main.dart';
import 'order Screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ShopScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> products = [];
  final firestore = FirebaseFirestore.instance;

  final List<Widget> screens = [

    ShopScreen(),
    CoffeeScreen(),
    OrdersScreen(),
    RegisterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    getPostsFromFirebase();
  }
  void getPostsFromFirebase(){
    firestore.collection("product").get().then((value) {

      for (var document in value.docs) {
        print(document.data());
        final product = document.data();
        products.add(product);
      }
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:
      // Center(  child: screens.elementAt(_selectedIndex),),
      Column(
        children: [
          SizedBox(height: 15,),
          SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(
              'Bakery',

              style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 60),color: Colors.brown),
            ),),
          ),
          // SizedBox(
          //   height: 200,
          //   child: ListView.builder(
          //     itemCount: 8,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) => blogItem2(index),
          //   ),
          // ),
          Expanded(


            child:

            ListView.builder(


              itemCount: products.length,

              itemBuilder: (context, index) => blogItem(index),
            ),
          )
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.facebook),
      //       label: 'Posts',
      //       backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notes),
      //       label: 'Notes',
      //       backgroundColor: Colors.greenAccent,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'chat',
      //       backgroundColor: Colors.purple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //       backgroundColor: Colors.pink,
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber,
      //   onTap: _onItemTapped,
      // ),

    );

  }
  Widget blogItem2(int index) {

          return

            Container(

            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // border: const Border.fromBorderSide(
              //   BorderSide(color: Colors.black),
              // ),
              color: Colors.white60,
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Image.network(
                    products[index]['imageUrl'],
                    height: 100,

                  ),
                ),
                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:Center(child:Text(
                    "French croissant",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ), ) ,
                ),

                SizedBox(height: 7,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:Center(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Price : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16),
                      ),
                      Text(
                        "14",
                        style: TextStyle(
                            color: Colors.green , fontSize: 15),
                      ),
                    ],
                  ),
                  ),
                ),

              ],
            ),
          );




  }



  Widget blogItem(int index) {



    return
      GestureDetector(
        onTap: (

            ) {
          String price = products[index]["price"];
          String name = products[index]["name"];
          String image = products[index]["imageUrl"];


          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemSelectedScreen(price: price, name: name, image: image)),
          );
        },
        child:   UnconstrainedBox(child:
        Container(
          width: 300,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // border: const Border.fromBorderSide(
            //   BorderSide(color: Colors.black),
            // ),
            color: Color(0xffe8d2c7),
          ),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),

                child:
                Image.network(
                  products[index]["imageUrl"],

                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Column(children: [

                      Text(
                        products[index]["name"].toString()!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      Text(
                        products[index]["price"].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      ),

                    ],),
                    Expanded(child:
                    IconButton(
                      onPressed: () {

                      },
                      alignment: Alignment.centerRight,
                      icon: const Icon(
                        size: 30,
                        Icons.add_box_outlined,
                        color: Colors.green,
                      ),
                    ), )



                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        )),
      );

  }
  void _sendDataToSecondScreen(BuildContext context ,int index) {
    String price = products[index]["price"];
    String name = products[index]["price"];



  }

}
class MyData {
  final String name;
  final String price;


  MyData(this.name, this.price);
}