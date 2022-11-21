import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

Future<File?> pickImageFromGalerry(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}
