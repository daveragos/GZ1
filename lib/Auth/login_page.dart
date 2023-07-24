// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:game_zoning/Utilities/ut_button.dart';
import 'package:game_zoning/Utilities/ut_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //cancel the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //cancel the loading circle
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.red,
              title: Center(
                  child: Text(message, style: TextStyle(color: Colors.white))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Stack(fit: StackFit.loose, children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.0,
                  ),

                  //logo
                  Icon(
                    Icons.gamepad,
                    size: 80.0,
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  //email field
                  UtTextField(
                    controller: emailController,
                    hintText: "enter your email",
                    obscureText: false,
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  //password field
                  UtTextField(
                    controller: passwordController,
                    hintText: "enter your password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  //sign in button
                  UtButton(
                    text: "Sign In",
                    onTap: signUserIn,
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  // unregistered
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "  Register here",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                  // continue with another option

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "or continue with",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // facebook
                      Image.asset(
                        "lib/assets/facebook.png",
                        height: 52,
                      ),
                      //google
                      GestureDetector(
                        onTap: () => {}, //AuthService().signInWithGoogle(),
                        child: Image.asset(
                          "lib/assets/google.png",
                          height: 52,
                        ),
                      ),
                      // apple
                      Image.asset(
                        "lib/assets/apple.png",
                        height: 52,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
