// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/core/common_widgets/repository/common_firebase_storage_repo.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) {
    final storage = ref.read(commonFirebaseStorageRepositoryProvider);
    return AuthRepository(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
      firebaseStorage: storage,
    );
  },
);

class AuthRepository {
  AuthRepository({
    required this.auth,
    required this.firestore,
    required this.firebaseStorage,
  });

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final CommonFirebaseStorageRepository firebaseStorage;

  Future<UserModel> getCurrentUserData() async {
    var userData = await firestore //
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();
    if (userData.data() != null) {
      return UserModel.fromMap(userData.data()!);
    } else {
      return UserModel.none;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> signInWithPhone(
    String phoneNumber, {
    required PhoneCodeSent onCodeSent,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: onCodeSent,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }

  Future<void> verifyOTP({
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      await auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: userOTP,
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }

  Future<void> saveUserProfileToFirebaseFirestore({
    required String name,
    required File? profilePic,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoURL = 'https://toppng.com/uploads/preview'
          '/instagram-default-profile-picture-11562973083brycehrmyv.png';
      if (profilePic != null) {
        photoURL = await firebaseStorage //
            .storeFileToFirebase('profilePic/$uid', profilePic);
      }
      var user = UserModel(
        name: name,
        profilePic: photoURL,
        uid: uid,
        isOnline: true,
        phoneNumber: auth.currentUser!.uid,
        groupId: const [],
      );
      await firestore.collection('users').doc(uid).set(user.toMap());
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }
}

class AuthException implements Exception {
  const AuthException(this.message, this.cause);

  factory AuthException.fromFirebase(FirebaseAuthException e) {
    return AuthException(e.message ?? e.toString(), e);
  }

  final dynamic cause;

  final String message;

  @override
  String toString() => message;
}
