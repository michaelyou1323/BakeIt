import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Register%20Screen.dart';
import 'package:project/shop%20Screen.dart';

import 'main.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrdersScreen> {
  final List<Map<String, dynamic>> orders = [];

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  // TextStyle linkStyle = TextStyle(color: Colors.blue);
  int _selectedIndex = 0;
  // final List<Widget> screens = [
  //
  //   RegisterScreen(),
  //   // NotesScreen(),
  //    ShopScreen(),
  //   // BlogScreen(),
  // ];


  final firestore = FirebaseFirestore.instance;



  @override
  void initState() {
    super.initState();
    getPostsFromFirebase();
  }
  void getPostsFromFirebase(){
    firestore.collection("orders").get().then((value) {

      for (var document in value.docs) {

        final order = document.data();
        orders.add(order);
      }
      setState(() {

      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) => blogItem(index),
            ), ),

      // Center(  child: screens.elementAt(_selectedIndex),),
      // Column(
      //   children: [
      //     SizedBox(height: 15,),
      //     SizedBox(
      //       width: 300,
      //       height: 100,
      //       child: Center(child: Text(
      //         'Welcome',
      //
      //         style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 60),color: Colors.brown),
      //       ),),
      //     ),
      //     SizedBox(
      //       height: 200,
      //       child: ListView.builder(
      //         itemCount: 8,
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (context, index) => blogItem2(),
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 2,
      //         itemBuilder: (context, index) => blogItem(),
      //       ),
      //     )
      //   ],
      // ),

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
  // Widget blogItem2() {
  //
  //
  //   return Container(
  //     width: 150,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       // border: const Border.fromBorderSide(
  //       //   BorderSide(color: Colors.black),
  //       // ),
  //       color: Colors.grey[300],
  //     ),
  //     margin: const EdgeInsets.all(10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(25),
  //             topRight: Radius.circular(25),
  //           ),
  //           child: Image.network(
  //             "https://e7.pngegg.com/pngimages/442/719/png-clipart-croissant-croissant-thumbnail.png",
  //             height: 100,
  //             width: double.infinity,
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //
  //         const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           child:Center(child:Text(
  //                  "French croissant",
  //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
  //         ), ) ,
  //         ),
  //
  //         SizedBox(height: 7,),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           child:Center(child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //
  //               Text(
  //                 "Price : ",
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(
  //                  fontSize: 16),
  //               ),
  //               Text(
  //                 "14",
  //                 style: TextStyle(
  //                     color: Colors.green , fontSize: 15),
  //               ),
  //             ],
  //           ),
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }


  Widget blogItem(int index) {


    return
      Column(
        children: [
          const SizedBox(height: 55,),
          Container(
            width: 300,
            
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff7e7e7e)),
              borderRadius: BorderRadius.circular(15),
              // border: const Border.fromBorderSide(
              //   BorderSide(color: Colors.black),
              // ),

            ),
            margin:  EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(child:SizedBox(
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius:  const BorderRadius.only(
                    topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                         ),
                       child: Image.network(

                      orders[index]["3imageUrl"],
                       height: 150,
                       width: 200,
                      fit: BoxFit.cover,
                        ),
                       ), width: 120 , height: 110,)

              ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10 ),
                  child: Row(
                    children: [
                      Column(children: [

                        Text(
                          orders[index]["1name"] ,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),

                        SizedBox(height: 7,),
                        Row(children: [
                          Text(
                            orders[index]["2price"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                          ),

                          const Text(
                            "   E.G",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle( color: Colors.red,fontWeight: FontWeight.w400, fontSize: 16),
                          ),

                        ],),


                      ],),
                      Expanded(child:
                      IconButton(
                        onPressed: () {
                          orders.removeAt(index);
                          setState(() {});
                        },
                        alignment: Alignment.centerRight,
                        icon: const Icon(
                          size: 30,
                          Icons.remove_circle_outline,
                          color: Colors.green,
                        ),
                      ), )
                    ],
                  ),
                ),

                Row(children: [

                  SizedBox(width: 11,),
                  Text(
                    orders[index]["4adds"],
                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle( color: Color(0xff830808),fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],),
                // const SizedBox(height: 20),

              new Divider(
             color: Colors.black,
             ),

              Padding(
             padding: const EdgeInsets.symmetric(horizontal:10 ),
                child:
                Row(children: [
                 

                  const Text(
                   "Quantity" + " :   ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( color: Colors.black,fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  Text(
                   orders[index]['5number'].toString() + "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( color: Colors.green,fontWeight: FontWeight.w400, fontSize: 16),
                  ),

                  SizedBox(width: 70,),

                  const Text(
                    "Total"  + " :    ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( color: Colors.black,fontWeight: FontWeight.w400, fontSize: 16),
                  ),

                  Text(
                    total(index).toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle( color: Colors.green,fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],),



    ),
                const SizedBox(height: 20),





              ],
            ),
          )


        ],
      );
  }

  int total(int index){

    String price = orders[index]["2price"];
    String number = orders[index]["5number"] ;

    int intVal1 = int.parse(price);
    int intVal2 = int.parse(number);

    int total = (intVal1 *intVal2 );

    return total;
  }
}
// class Blog2 {
//   String num;
//   String name;
//   String price;
//   String imageUrl;
//
//
//   Blog2( {required this.num,required  this.name, required this.price,required this.imageUrl});
//
// }
