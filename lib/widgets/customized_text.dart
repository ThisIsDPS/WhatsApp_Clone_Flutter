import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  const CustomizedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'Read our ',
            style: TextStyle(
                color: currentBrightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: currentBrightness == Brightness.light
                  ? const Color.fromARGB(255, 5, 94, 48)
                  : const Color.fromRGBO(5, 94, 78, 1),
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: '. Tap "Agree and continue" to accept the ',
            style: TextStyle(
                color: currentBrightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black),
          ),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              color: currentBrightness == Brightness.light
                  ? const Color.fromARGB(255, 5, 94, 48)
                  : const Color.fromRGBO(5, 94, 78, 1),
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: '.',
            style: TextStyle(
                color: currentBrightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black),
          ),
        ],
      ),
    );
  }
}
