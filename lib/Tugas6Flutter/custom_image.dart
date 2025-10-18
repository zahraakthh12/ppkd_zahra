import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.09,
      width: 33.83,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Image.asset(imagePath, height: 32.09, width: 33.83),
    );
  }
}