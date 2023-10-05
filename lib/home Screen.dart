import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Register%20Screen.dart';
import 'package:project/coffee%20Screen.dart';
import 'package:project/order%20Screen.dart';
import 'package:project/profile%20Screen.dart';
import 'package:project/shop%20Screen.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);
  int _selectedIndex = 0;
  final List<Widget> screens = [
    ShopScreen(),
    CoffeeScreen(),
    OrdersScreen(),
    ProfileScreen(),

    // NotesScreen(),


    // BlogScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Center(  child: screens.elementAt(_selectedIndex),),
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

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bakery_dining_rounded),
            label: 'SHOP',
            backgroundColor: Color(0xffd3c1a8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Coffee',
            backgroundColor: Color(0xffd3c1a8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Orders',
            backgroundColor:Color(0xffd3c1a8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'More',
            backgroundColor: Color(0xffd3c1a8),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:Color(0xff151313),
        onTap: _onItemTapped,
      ),



    );

  }
  Widget blogItem2() {


    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        // border: const Border.fromBorderSide(
        //   BorderSide(color: Colors.black),
        // ),
        color: Colors.grey[300],
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
              "https://e7.pngegg.com/pngimages/442/719/png-clipart-croissant-croissant-thumbnail.png",
              height: 100,
              width: double.infinity,
              fit: BoxFit.fill,
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


  Widget blogItem() {


    return Container(
      width: 200,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: const Border.fromBorderSide(
        //   BorderSide(color: Colors.black),
        // ),
        color: Colors.grey[300],
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
            child: Image.network(
              "https://e7.pngegg.com/pngimages/933/748/png-clipart-croissant-croissant.png",
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
                Expanded(
                  child: Text(
                    "blog.title",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.purple,
                  ),
                ),
                IconButton(
                  onPressed: () {


                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "blog.body,",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
