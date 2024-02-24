import 'package:flutter/material.dart';

import '../Utils/color.dart';

class customBottom extends StatelessWidget {
  customBottom({
    this.background =const Color(0xff30312D),
    required this.text,
    this.onPressed,
    this.foreground = Colors.white,
  });
  final String text;
  final Function()? onPressed;
  final Color foreground;
  final Color background;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: foreground,
            backgroundColor: background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(text, style: const TextStyle(fontSize: 15)));
  }
}
