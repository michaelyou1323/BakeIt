import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/Register%20Screen.dart';
import 'dart:ui' as ui show Image;

import 'package:project/home%20Screen.dart';
import 'package:project/order%20Screen.dart';
import 'package:project/shop%20Screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(),

    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      'Welcome',
                      style: GoogleFonts.lobster(textStyle: const TextStyle(fontSize: 60),color: Colors.white60),
                    ),),
                  ),

                const SizedBox(height: 110),

            SizedBox(
              width: 310,
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
                  labelText: 'Email',
                ),
              ),
            ),

                SizedBox(height: 10,),

                SizedBox(
                  width: 310,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
                      labelText: 'Password',
                    ),
                  ),
                ),

                SizedBox(height: 10,),


                SizedBox(child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffad9c00))),onPressed: () {
                  login(context);
                }, child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),height: 50,width: 300,),

                SizedBox(height: 15,),



            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign Up',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator .push( context,
                            MaterialPageRoute (
                                builder: (context) => RegisterScreen()), );

                          }),
                ],
              ),
            ),
                const SizedBox(height: 50),

              ],
            )


        ),
        ),
      ),

    );
  }



  void login(BuildContext context){

    String email = emailController.text;


    String password = passwordController.text;
    FirebaseAuth firebaseAuth = FirebaseAuth. instance;

    firebaseAuth.signInWithEmailAndPassword( email: email, password: password,
    ). then ((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // Navigator.push( context,
      //   MaterialPageRoute (
      //       builder: (context) => HomeScreen()), );
      //

    }).catchError ((error) {
     showErrorMessage(error.toString());
    });
  }

  void showErrorMessage(String errorMessage){
    Fluttertoast.showToast (
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb :1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0
    );
  }

}

class CurvePainter extends CustomPainter {




  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();


    // canvas.drawImage("https://www.gottabemobile.com/wp-content/uploads/2017/11/Dell-Latitude-7839-2-in-1-14-850x585.jpg" as ui.Image  ,  Offset.zero, paint);
    paint.color = const Color(0xff4d4c18);
    paint.style = PaintingStyle.fill; // Change this to fill
    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
