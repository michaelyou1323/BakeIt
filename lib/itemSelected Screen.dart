import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Register%20Screen.dart';
import 'package:project/shop%20Screen.dart';

import 'coffee Screen.dart';
import 'main.dart';
import 'order Screen.dart';

final firestore  = FirebaseFirestore.instance;
class ItemSelectedScreen extends StatefulWidget {



  // const ItemSelectedScreen({super.key, required this.data});

  const ItemSelectedScreen({Key? key, required this.name, required this.price, required this.image }) : super(key: key);
   final String name;
   final String price;
   final String image;

  @override
  State<ItemSelectedScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ItemSelectedScreen> {

  String? _name;
  String? _price;
  String? _image;
  int counter = 1;


  final addController = TextEditingController();

  final List<Map<String, dynamic>> orders = [];
  final firestore = FirebaseFirestore.instance;






  void _onItemTapped(int index) {
    setState(() {

    });
  }


  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _price = widget.price;
    _image = widget.image;


}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body:
      // Center(  child: screens.elementAt(_selectedIndex),),
      Column(
        children: [
          const SizedBox(height: 55,),
           Container(
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: const Border.fromBorderSide(
                //   BorderSide(color: Colors.black),
                // ),

              ),
              margin:  EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:  const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                     _image!,
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
                            _name! ,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),

                          SizedBox(height: 7,),
                          Row(children: [
                            Text(
                            _price!,
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
                            // orders.add({
                            //   'name': _name,
                            //   'imageUrl': _image,
                            //   "price" :_price ,
                            //   "adds" : addController,
                            // });
                            String adds = addController.text;
                            firestore.collection("orders").add({
                              '1name': _name,
                              "2price": _price,
                              '3imageUrl': _image,
                              "4adds" : adds,
                              "5number" : counter.toString(),
                            });

                            addController.clear();


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

                  const SizedBox(height: 20),

                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).cardColor),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(child:  SizedBox(
                          width: 200,
                          height: 40,
                          child: TextField(
                            controller: addController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(10))),
                              labelText: 'Want some adds!',
                            ),
                          ),
                        ),),

                        InkWell(
                            onTap: () {},
                            child: IconButton(

                              color: Colors.red,
                              onPressed: () {

                                setState((){
                                  counter = counter-1;
                                  //will refresh content of this StatefulBuilder
                                });
                              },  icon: const Icon(

                              Icons.remove,
                              color: Colors.green,
                            ),
                            )),
                        Container(

                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white60),
                          child: Text(

                            counter.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: IconButton(

                              color: Colors.green,
                              onPressed: () {
                                setState((){
                                  counter = counter+1;
                                  //will refresh content of this StatefulBuilder
                                });

                              },  icon: const Icon(

                              Icons.add,
                              color: Colors.green,
                            ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),


                ],
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
  // Widget blogItem2(int index) {
  //
  //
  //   return Container(
  //     width: 150,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       // border: const Border.fromBorderSide(
  //       //   BorderSide(color: Colors.black),
  //       // ),
  //       color: Colors.white60,
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
  //             coffee[index]['imageUrl'],
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
  //             "French croissant",
  //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
  //           ), ) ,
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
  //                     fontSize: 16),
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



}
