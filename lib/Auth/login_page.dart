// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:game_zoning/Utilities/ut_button.dart';
import 'package:game_zoning/Utilities/ut_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
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

              //username field
              Ut_TextField(
                controller: emailController,
                hintText: "enter your username",
                obscureText: false,
              ),

              SizedBox(
                height: 10.0,
              ),

              //password field
              Ut_TextField(
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
              Ut_Button(
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
                        "continue with",
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
                  Image.asset(
                    "lib/assets/google.png",
                    height: 52,
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
      resizeToAvoidBottomInset: true,
    );
  }
}
