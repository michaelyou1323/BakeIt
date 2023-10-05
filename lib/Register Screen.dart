import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterScreen> {
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
                'Sign up',
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

            SizedBox(height: 50,),


            SizedBox(child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffad9c00))),onPressed: () {
              sign_up(context);
            }, child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),height: 50,width: 300,),

            SizedBox(height: 15,),



            // RichText(
            //   text: TextSpan(
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: 'Sign Up',
            //           style: linkStyle,
            //           recognizer: TapGestureRecognizer()
            //             ..onTap = () {
            //               print('mmmm0000000000');
            //             }),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 50),

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