import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepoistory = ref.watch(authRepositoryProvider);
  return AuthController(authRepoistory: authRepoistory, ref: ref);
});

class AuthController {
  final AuthRepoistory authRepoistory;
  final ProviderRef ref;

  AuthController({required this.authRepoistory, required this.ref});

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
}
