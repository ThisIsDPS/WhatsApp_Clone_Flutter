import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/widgets/loader.dart';
import 'package:whatsapp_clone_flutter/features/status/controller/status_controller.dart';
import 'package:whatsapp_clone_flutter/features/status/screens/status_screen.dart';
import 'package:whatsapp_clone_flutter/models/status_model.dart';

class StatusContactsScreen extends ConsumerWidget {
  const StatusContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Status>>(
      future: ref.read(statusControllerProvider).getStatus(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var statusData = snapshot.data![index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StatusScreen.routeName,
                  arguments: statusData,
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  title: Text(
                    statusData.username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      statusData.profilePic,
                    ),
                    radius: 26,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
