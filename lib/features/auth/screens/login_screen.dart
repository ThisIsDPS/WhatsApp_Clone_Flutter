import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
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
          color: const Color.fromARGB(255, 5, 94, 48),
        ),
        title: const Text(
          'Enter your phone number',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 5, 94, 48),
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
              const Text(
                'WhatsApp will need to verify your phone number',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 5, 94, 48),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text(
                  'Pick Country',
                  style: TextStyle(
                    color: Color.fromARGB(229, 3, 66, 36),
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}