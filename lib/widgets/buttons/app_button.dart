import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onClick,
    this.color,
  }) : super(key: key);
  final String title;
  final IconData? icon;
  final Function()? onClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onClick,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Icon(icon)],
      ),
    );
  }
}
