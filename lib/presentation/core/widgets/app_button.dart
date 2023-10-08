import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double width;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final IconData? icon;
  final void Function()? onPressed;
  const AppButton(
      {super.key,
      required this.width,
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
        fixedSize: MaterialStatePropertyAll(Size(width, 50))
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(color: textColor, fontSize: 15),
                ),
                Icon(
                  icon,
                  color: textColor,
                  size: 15,
                )
              ],
            )
          : Text(
              title,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
    );
  }
}
