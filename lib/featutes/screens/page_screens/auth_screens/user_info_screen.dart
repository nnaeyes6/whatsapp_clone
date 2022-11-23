import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/core/utils/util_snackbar.dart';
import 'package:whatsapp_clone/featutes/auth/controller/auth_controller_riverpod.dart';
import 'package:whatsapp_clone/router.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _selectedImage() async {
    final pickedImage = await pickImageFromGalerry(context);
    setState(() => image = pickedImage);
  }

  Future<void> _storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      final successful = await ref //
          .read(authControllerProvider)
          .saveUserDataToFirebase(context, image, name);
      if(successful && mounted) {
        context.navigateToMobileLayout();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Stack(
              children: [
                image == null
                    ? const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://toppng.com/uploads/preview/instagram-default-profile-picture-11562973083brycehrmyv.png'),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(image!),
                      ),
                Positioned(
                  bottom: -10,
                  left: 70,
                  child: IconButton(
                    onPressed: _selectedImage,
                    icon: const Icon(Icons.add_a_photo_rounded),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _storeUserData,
                  icon: const Icon(Icons.done),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
