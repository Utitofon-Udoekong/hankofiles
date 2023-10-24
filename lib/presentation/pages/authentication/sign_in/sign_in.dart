import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/presentation/core/widgets/app_button.dart';
import 'package:hankofiles/presentation/core/widgets/app_form_field.dart';
import 'package:hankofiles/presentation/core/widgets/app_loader.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:hankofiles/presentation/core/widgets/app_snackbar.dart';
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart';
import 'package:hankofiles/presentation/pages/splash/widgets/hero_image.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final email = context.select((AuthCubit bloc) => bloc.state.email);
    final isLoading = context.select((AuthCubit bloc) => bloc.state.isLoading);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current.failure.isNotEmpty,
          listener: (context, state) {
            AppSnackbar.showSnackBar(context, state.failure, true);
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current.success == "User logged in successfully",
          listener: (context, state) {
            AppSnackbar.showSnackBar(context, state.success, false);
            final id = state.userFromEmail.id;
            print(id);
            context.read<StorageCubit>().listFiles(id: id);
            context.go("/home");
            context.read<AuthCubit>().reset();
          },
        ),
      ],
      child: Apploader(
        isLoading: isLoading,
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroImage(
                width: width,
              ),
              const SizedBox(height: 30),
              AppFormField(
                hintText: "Enter your email address",
                onChanged: (email) => context.read<AuthCubit>().setEmail(email),
              ),
              const SizedBox(height: 20),
              AppButton(
                  width: width,
                  backgroundColor: kBlack,
                  textColor: kWhite,
                  hasIcon: false,
                  title: "Sign In",
                  disabled: !isValidEmail(email),
                  onPressed: () => context.read<AuthCubit>().signIn())
            ],
          ),
        )),
      ),
    );
  }
}
