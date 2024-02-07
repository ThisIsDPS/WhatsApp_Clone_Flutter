import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  const CustomizedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
        children: [
          const TextSpan(text: 'Read our '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: Color.fromARGB(255, 5, 94, 48),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
          const TextSpan(
            text:
                '. Tap "Agree and continue" to accept the ',
          ),
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: Color.fromARGB(255, 5, 94, 48),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
          const TextSpan(
            text: '.',
          ),
        ],
      ),
    );
  }
}