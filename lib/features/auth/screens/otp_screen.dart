import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;

  const OTPScreen({
    super.key,
    required this.verificationId,
  });

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    Brightness currentBrightness = Theme.of(context).brightness;
    Color tempColor = const Color.fromARGB(255, 5, 94, 48);
    if (currentBrightness == Brightness.dark) {
      tempColor = Colors.white70;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 22,
          color: tempColor,
        ),
        title: Text(
          'Verifying your number',
          style: TextStyle(
            fontSize: 20,
            color: tempColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'We have sent an SMS with a code',
              style: TextStyle(
                fontSize: 14,
                color: tempColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    verifyOTP(ref, context, value.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
