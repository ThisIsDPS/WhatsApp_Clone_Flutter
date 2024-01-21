import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_clone_flutter/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepoistory = ref.watch(authRepositoryProvider);
  return AuthController(authRepoistory: authRepoistory, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepoistory authRepoistory;
  final ProviderRef ref;

  AuthController({
    required this.authRepoistory,
    required this.ref,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepoistory.getCurrentUserData();
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepoistory.signInWithPhoneNumber(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepoistory.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepoistory.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }

  Stream<UserModel> userDataById(String userId) {
    return authRepoistory.userData(userId);
  }

  void setUserState(bool isOnline) {
    authRepoistory.setUserState(isOnline);
  }
}
