import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfileScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body: CustomPaint(
        painter: CurvePainter(),
        child:Center(child:SingleChildScrollView(child:
        Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text(
                'Contact Us',
                style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 60),color: Colors.white),
              ),),

            ),

            SizedBox(height: 80,),

            SizedBox(
              width: 300,

              child:Text(
                'Phone Numbers',
                style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 30),color: Colors.black),
              ),
            ),



            Container(
              width: 300,

              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff7e7e7e)),
                borderRadius: BorderRadius.circular(15),
                // border: const Border.fromBorderSide(
                //   BorderSide(color: Colors.black),
                // ),

              ),
              child:
              Column(children: [

                SizedBox(height: 15,),

                SizedBox(
                  width: 300,

                  child:Text(
                    '01220140685',
                    textAlign: TextAlign.center ,
                    style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 22),color: Colors.grey),
                  ),),


                SizedBox(height:15 ,),

                SizedBox(
                  width: 300,

                  child:Text(
                    '01114237464',
                    textAlign: TextAlign.center ,
                    style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 22),color: Colors.grey),
                  ),),

                const SizedBox(height:15 ,),

                SizedBox(
                  width: 300,

                  child:Text(
                    '0235829094',
                    textAlign: TextAlign.center ,
                    style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 22),color: Colors.grey),
                  ),),


                const SizedBox(height:15 ,),

                SizedBox(
                  width: 300,

                  child:Text(
                    '19666',
                    textAlign: TextAlign.center ,
                    style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 22),color: Colors.black87),
                  ),),

                const SizedBox(height:23 ,),

                Row(children: [IconButton(onPressed: () {

                }, icon: Icon(Icons.facebook),iconSize: 40,),


                  InkWell(
                      child: new Text('Open Browser'),
                      onTap: () {
                        'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget';
                      }
                  )],),




              ],)


              ),

            SizedBox(height: 30,)
          ],

        )


        ),
        ),
      ),

    );
  }



  void sign_up(BuildContext context){

    String email = emailController.text;


    String password = passwordController.text;
    FirebaseAuth firebaseAuth = FirebaseAuth. instance;

    firebaseAuth.createUserWithEmailAndPassword( email: email, password: password,
    ).then (
          (value) {

        Navigator.pop (context);
        showMessage ("Account created");
      },
    ).catchError((error) {
    showMessage(error.toString());
    },
    );
  }
  void showMessage(String errorMessage){
    Fluttertoast.showToast (
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb :1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0
    );
  }
}