import 'package:flutter/material.dart';
class square_tile extends StatelessWidget {
  final String imgPath;
  const square_tile({super.key,
  required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white),
      ),
      child: Image.asset(imgPath,
      height: 48),
    );
  }
}