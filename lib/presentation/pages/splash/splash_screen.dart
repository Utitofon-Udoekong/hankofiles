import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2,),(){
      context.go("/onboarding");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("images/logo.png")
    );
  }
}