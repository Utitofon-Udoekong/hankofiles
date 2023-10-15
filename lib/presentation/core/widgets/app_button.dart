import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final IconData? icon;
  final bool disabled;
  final void Function()? onPressed;
  final double width;
  const AppButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.hasIcon,
      required this.width,
      this.icon,
      this.onPressed,
      required this.title, 
      required this.disabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(disabled ? backgroundColor.withOpacity(0.4) : backgroundColor),
        fixedSize: MaterialStatePropertyAll(Size(width, 50)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
