// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_clone/featutes/auth/repository/auth_repo.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});
final userDataAuthProvider = FutureProvider((ref) {
  // change here if it breaks

  final userAuthController = ref.watch(authControllerProvider);
  return userAuthController.getUserData();
});

class AuthController {
  final ProviderRef ref;
  final AuthRepository authRepository;
  AuthController({
    required this.ref,
    required this.authRepository,
  });
  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void signInWithPhoneNum(
    BuildContext context,
    String phoneNumber,
  ) {
    authRepository.signInWithPhone(
      context,
      phoneNumber,
    );
  }

  void verifyOTP(BuildContext context, String userOTP, String verificationId) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
      BuildContext context, File? profilePic, String name) {
    authRepository.saveUserProfileToFirebaseFirestore(
        name: name, profilePic: profilePic, ref: ref, context: context);
  }
}
