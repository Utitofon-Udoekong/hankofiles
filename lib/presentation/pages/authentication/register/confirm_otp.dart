import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';
import 'package:hankofiles/presentation/pages/storage/cubit/storage_cubit.dart';
import 'package:hankofiles/presentation/core/widgets/otp_field/otp_box_style.dart';
import 'package:hankofiles/presentation/core/widgets/otp_field/otp_field_style.dart';
import 'package:hankofiles/presentation/core/widgets/otp_field/otp_text_field.dart';
import 'package:hankofiles/presentation/pages/authentication/cubit/auth_cubit.dart';
import 'package:hankofiles/presentation/core/widgets/app_loader.dart';

class ConfirmOTP extends StatefulWidget {
  const ConfirmOTP({super.key});

  @override
  State<ConfirmOTP> createState() => _ConfirmOTPState();
}

class _ConfirmOTPState extends State<ConfirmOTP> {
  //Function to start the timer. Runs on page load.
  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_seconds == smsCodeTimeoutSeconds) {
          timer.cancel();
        } else {
          setState(() {
            _seconds++;
          });
        }
      },
    );
  }

  OtpFieldController controller = OtpFieldController();
  // Modify to change the timeout duration
  int smsCodeTimeoutSeconds = 150;
  late Timer? _timer;

  int _seconds = 0;

  // formats given integer to be displayed as a timer. e.g 00:00
  String formatSeconds(int value) =>
      '${formatDecimal(value ~/ 60)}:${formatDecimal(value % 60)}';

  // formats integer to be padded with a zero in base 10.
  String formatDecimal(int value) => value < 10 ? '0$value' : value.toString();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final email = context.select((AuthCubit bloc) => bloc.state.email);
    final isLoading = context.select((AuthCubit bloc) => bloc.state.isLoading);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current.code.length == 6 && current.isLoading == false,
          listener: (context, state) {
            Future.delayed(const Duration(seconds: 1), () => context.read<AuthCubit>().verifyEmail());
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen:(previous, current) => current.success == "User Verified",
          listener: (context, state) {
            final id = state.userModel.id;
            context.read<StorageCubit>().listFiles(id: id);
            Future.delayed(const Duration(seconds: 2), () => context.go("/home"));
            context.read<AuthCubit>().reset();
          },
        ),
      ],
      child: Scaffold(
          body: SafeArea(
              bottom: false,
              child: Apploader(
                isLoading: isLoading,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            InkWell(
                                onTap: () => context.pop(),
                                child: Icon(Icons.adaptive.arrow_back)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                    "Check your inbox",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: Colors.black)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "We just sent a ",
                                  style: Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                  text: "6-digit ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: "verification code to ",
                                  style: Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                  text: email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text:
                                      ". Enter the code in the boxes below to continue.",
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ])),
                            const SizedBox(
                              height: 30,
                            ),
                            OTPTextField(
                              controller: controller,
                              fieldHeight: width / 7 - 10,
                              fieldWidth: width / 7 - 10,
                              length: 6,
                              width: width,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 20, color: kBlack),
                              fieldStyle: FieldStyle.box,
                              otpFieldStyle: OtpFieldStyle(
                                  borderColor: kBorderColor,
                                  focusBorderColor: kBorderColor),
                              keyboardType: TextInputType.number,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              onCompleted: (value) =>
                                  context.read<AuthCubit>().setCode(value),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Expires later: ",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                countDownTimer(
                                  smsCodeTimeoutSeconds: smsCodeTimeoutSeconds,
                                ),
                              ],
                            )),
                            const SizedBox(
                              height: 60,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Didn't get the code?\n\n",
                                  style: Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                  text: "Resend Code",
                                  style: Theme.of(context).textTheme.titleSmall,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        context.read<AuthCubit>().signUp()),
                            ]))
                          ]),
                    )),
              ))),
    );
  }

  // COUNTDOWN TIMER WIDGET. USES A TIMEOUT PARAMETER TO SET A DURATION TO REQUEST FOR ANOTHER PASSCODE
  Widget countDownTimer({required int smsCodeTimeoutSeconds}) {
    return Text(
      formatSeconds(smsCodeTimeoutSeconds - _seconds),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
