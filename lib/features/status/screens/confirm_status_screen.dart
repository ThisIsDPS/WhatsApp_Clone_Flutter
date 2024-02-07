import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/status/controller/status_controller.dart';

class ConfirmStatusScreen extends ConsumerWidget {
  static const String routeName = '/confirm-status-screen';
  final File file;
  const ConfirmStatusScreen({
    super.key,
    required this.file,
  });

  void addStatus(WidgetRef ref, BuildContext context) {
    ref.read(statusControllerProvider).addStatus(file, context);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.file(file),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addStatus(ref, context),
        backgroundColor: const Color.fromRGBO(5, 94, 78, 1),
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    );
  }
}
