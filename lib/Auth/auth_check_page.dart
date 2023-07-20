// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_zoning/home.dart';
import 'home_page.dart';
import 'login_register_page.dart';

class AuthCheckPage extends StatelessWidget {
  const AuthCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // check if logged in
          if (snapshot.hasData) {
            return Home();
          }
          //check if not logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
