import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/presentation/core/widgets/app_button.dart';
import 'package:hankofiles/presentation/pages/splash/widgets/hero_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          const Spacer(),
          HeroImage(width: width),
          const SizedBox(
            height: 30,
          ),
          Text("Welcome to", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: kBlack)),
          const SizedBox(
            height: 10,
          ),
          Text("Van-Files", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: kBlack),),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Best cloud storage platform for all business and individuals to manage there data", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: kBlack)),
          const SizedBox(
            height: 20,
          ),
          const Text("Join For Free."),
          const SizedBox(
            height: 30,
          ),
              AppButton(
                width: width,
                backgroundColor: Colors.white,
                textColor: kBlack,
                hasIcon: false,
                title: "Login", 
                onPressed: () => context.push("/login"),
                disabled: false,
              ),
              const SizedBox(height: 20,),
              AppButton(
                width: width,
                backgroundColor: kPrimary,
                textColor: kWhite,
                hasIcon: false,
                title: "Register",
                disabled: false,
                onPressed: () => context.push("/register")
              ),
          
          const Spacer(),
              ],
            ),
        ));
  }
}
