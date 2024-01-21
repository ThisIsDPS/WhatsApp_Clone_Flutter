import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone_flutter/common/widgets/loader.dart';
import 'package:whatsapp_clone_flutter/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_clone_flutter/models/chat_contact.dart';
import 'package:whatsapp_clone_flutter/features/chat/screens/mobile_chat_screen.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<ChatContact>>(
        stream: ref.watch(chatControllerProvider).chatContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var chatContactData = snapshot.data![index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MobileChatScreen.routeName,
                    arguments: {
                      'name': chatContactData.name,
                      'uid': chatContactData.contactId,
                      // 'isGroupChat': false,
                      // 'profilePic': chatContactData.profilePic,
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        chatContactData.profilePic,
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      chatContactData.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      chatContactData.lastMessage,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      DateFormat.Hm().format(chatContactData.timeSent),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
