import 'package:flutter/material.dart';
class textfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const textfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
    });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(248, 178, 173, 173),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w200,
          )
        )));
  }
}
