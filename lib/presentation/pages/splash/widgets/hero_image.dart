import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double width;
  const HeroImage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset("images/logo.png", width: width / 2,));
  }
}