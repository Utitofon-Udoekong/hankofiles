import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final IconData? icon;
  final void Function()? onPressed;
  const AppButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.hasIcon,
      this.icon,
      this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: textColor, fontSize: 20),
                ),
                const SizedBox(width: 15),
                Icon(
                  icon,
                  color: textColor,
                  size: 20,
                )
              ],
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: textColor, fontSize: 20),
            ),
    );
  }
}
