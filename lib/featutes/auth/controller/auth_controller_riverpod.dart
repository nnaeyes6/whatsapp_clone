// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/core/utils/util_snackbar.dart';
import 'package:whatsapp_clone/featutes/auth/repository/auth_repo.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final userDataAuthProvider = Provider<UserModel>((ref) {
  final userAuthController = ref.watch(authControllerProvider);
  return userAuthController.currentUser;
});

final authControllerProvider = StateProvider((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  AuthController({
    required this.ref,
    required this.authRepository,
  });

  final StateProviderRef ref;
  final AuthRepository authRepository;

  late UserModel _currentUser;

  UserModel get currentUser => _currentUser;

  Future<void> init() async {
    _currentUser = await authRepository.getCurrentUserData();
  }

  void logOut() {
    authRepository.signOut();
    _currentUser = UserModel.none;
    ref.notifyListeners();
  }

  Future<void> _updateUser() async {
    _currentUser = await authRepository.getCurrentUserData();
    ref.notifyListeners();
  }

  /// Returns verificationId
  Future<String> signInWithPhoneNum(String phoneNumber) {
    final completer = Completer<String>();
    authRepository.signInWithPhone(
      phoneNumber,
      onCodeSent: (String verificationId, int? forceResendingToken) {
        completer.complete(verificationId);
      },
    ).catchError((error, stackTrace) {
      completer.completeError(error, stackTrace);
    });
    return completer.future;
  }

  Future<void> verifyOTP(BuildContext context, String userOTP, String verificationId) async {
    try {
      await authRepository.verifyOTP(
        verificationId: verificationId,
        userOTP: userOTP,
      );
      await _updateUser();
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<bool> saveUserDataToFirebase(BuildContext context, File? profilePic, String name) async {
    try {
      await authRepository.saveUserProfileToFirebaseFirestore(
        name: name,
        profilePic: profilePic,
      );
      await _updateUser();
      return true;
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
      return false;
    }
  }
}
