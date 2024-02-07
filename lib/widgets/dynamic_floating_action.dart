// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/common/utils/utils.dart';
import 'package:whatsapp_clone_flutter/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:whatsapp_clone_flutter/features/status/screens/confirm_status_screen.dart';

Widget dynamicFloatingActionButton(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 1:
      return FloatingActionButton(
        onPressed: () async {
          File? pickedImage = await pickImageFromGallery(context);
          if (pickedImage != null) {
            Navigator.pushNamed(
              context,
              ConfirmStatusScreen.routeName,
              arguments: pickedImage,
            );
          }
        },
        child: const Icon(Icons.camera_alt_rounded),
      );
    case 2:
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_call),
      );
    default:
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SelectContactsScreen.routeName);
        },
        child: const Icon(Icons.message_rounded),
      );
  }
}
