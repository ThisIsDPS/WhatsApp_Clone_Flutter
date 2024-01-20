import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/select_contacts/screens/select_contacts_screen.dart';

Widget dynamicFloatingActionButton(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 1:
      return FloatingActionButton(
        onPressed: () {},
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
