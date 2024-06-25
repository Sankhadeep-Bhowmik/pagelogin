import 'package:flutter/material.dart';
class square_tile extends StatelessWidget {
  final String imgPath;
  final Function()? onTap;
  const square_tile({super.key,
  required this.imgPath,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white),
        ),
        child: Image.asset(imgPath,
        height: 48),
      ),
    );
  }
}