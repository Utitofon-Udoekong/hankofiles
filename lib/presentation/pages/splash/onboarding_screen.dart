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
          Text("Welcome to", style: Theme.of(context).textTheme.titleLarge),
          Text("Hanko Files", style: Theme.of(context).textTheme.headlineMedium,),
          Text(
              "Best cloud storage platform for all business and individuals to manage there data", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          const Text("Join For Free."),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                backgroundColor: kBlack.withOpacity(0.1),
                textColor: kBlack,
                hasIcon: true,
                icon: Icons.fingerprint,
                title: "Bio",
              ),
              const AppButton(
                backgroundColor: kRed,
                textColor: kWhite,
                hasIcon: true,
                icon: Icons.arrow_forward,
                title: "Sign In",
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: InkWell(
              onTap: () => context.go("/register"),
              child: const Text("Create an account")),
          ),
          const Spacer(),
              ],
            ),
        ));
  }
}
