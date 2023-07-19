// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class UtTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const UtTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.lightBlue.shade200,
          filled: true,
        ),
      ),
    );
  }
}
