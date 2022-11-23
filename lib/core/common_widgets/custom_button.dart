// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whatsapp_clone/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff8388C9),
          minimumSize: const Size(double.infinity, 50)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: blackColor, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
