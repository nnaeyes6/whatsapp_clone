import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/common_widgets/ktext.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: KText(
        text: content,
        size: 16,
        fontWeight: FontWeight.w600,
        color: blackColor,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
