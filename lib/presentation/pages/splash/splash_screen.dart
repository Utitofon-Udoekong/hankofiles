import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/presentation/pages/splash/widgets/hero_image.dart';

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
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: HeroImage(width: width)
    );
  }
}