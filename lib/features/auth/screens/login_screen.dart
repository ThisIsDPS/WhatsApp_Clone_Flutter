import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/utils/utils.dart';
import 'package:whatsapp_clone_flutter/common/widgets/custom_button.dart';
import 'package:whatsapp_clone_flutter/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  String? phoneCode;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          phoneCode = country.phoneCode;
          phoneController.clear();
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (phoneCode != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+$phoneCode$phoneNumber');
      // Types of ref :- (You can hover over this above ref & ref in 'auth_controller.dart' to see the type)
      // ProviderRef ~ Interact provider with provider
      // WidgetRef ~ Makes widget interact with provider
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields!');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Enter your phone number',
          style: TextStyle(
            fontSize: 20,
            color: tempColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'WhatsApp will need to verify your phone number',
                style: TextStyle(
                  fontSize: 14,
                  color: tempColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: pickCountry,
                child: Text(
                  'Pick Country',
                  style: TextStyle(
                    color: currentBrightness == Brightness.light
                        ? const Color.fromARGB(229, 3, 66, 36)
                        : const Color.fromARGB(234, 35, 128, 204),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  phoneCode != null ? Text('+$phoneCode') : const Text(''),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 260,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'phone number',
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 70,
                width: 100,
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  text: 'NEXT',
                  onPressed: sendPhoneNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
