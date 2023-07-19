import 'package:flutter/material.dart';

class UtButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const UtButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.lightGreen,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}
