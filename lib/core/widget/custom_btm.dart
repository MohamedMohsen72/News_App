

import 'package:flutter/material.dart';

import '../Utils/color.dart';

class customBottom extends StatelessWidget {
  customBottom({super.key, required this.text,required this.onPressed});
  String text;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(

            foregroundColor: Colors.white,
            backgroundColor: AppColor.Colorcon,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text (text,style: const TextStyle(fontSize: 15))
    )
    ;
  }
}
