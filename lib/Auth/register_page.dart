// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:game_zoning/Utilities/ut_button.dart';
import 'package:game_zoning/Utilities/ut_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_zoning/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      //check if password and confirmpassword is same
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else
        showErrorMessage("Passwords don't match");
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
                    height: 100.0,
                  ),

                  //logo
                  Icon(
                    Icons.gamepad,
                    size: 60.0,
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  //email field
                  UtTextField(
                    controller: emailController,
                    hintText: "Enter your Email",
                    obscureText: false,
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  //password field
                  UtTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //confirm password field
                  UtTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm your password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  //sign in button
                  UtButton(
                    text: "Sign Up",
                    onTap: signUserUp,
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  // unregistered
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "  Login now",
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
                        onTap: () => AuthService().signInWithGoogle(),
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
