import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepoistory = ref.watch(authRepositoryProvider);
  return AuthController(authRepoistory: authRepoistory);
});

class AuthController {
  final AuthRepoistory authRepoistory;

  AuthController({
    required this.authRepoistory,
  });

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
}
