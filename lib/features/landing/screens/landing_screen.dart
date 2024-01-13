import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/common/widgets/custom_button.dart';
import 'package:whatsapp_clone_flutter/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/customized_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 5, 94, 48),
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/bg.png',
                width: 280,
                color: const Color.fromRGBO(5, 94, 78, 1),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: CustomizedText(),
              ),
              SizedBox(
                width: 260,
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () => navigateToLoginScreen(context),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
