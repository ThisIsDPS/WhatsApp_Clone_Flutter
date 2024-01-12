import 'package:flutter/material.dart';

Widget dynamicFloatingActionButton(int currentIndex) {
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
        onPressed: () {},
        child: const Icon(Icons.message_rounded),
      );
  }
}
