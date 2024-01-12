import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/models/info.dart';
import 'package:whatsapp_clone_flutter/screens/mobile_chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MobileChatScreen(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(info[index]['profilePic']!),
                radius: 30,
              ),
              title: Text(
                info[index]['name']!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                info[index]['message']!,
                style: const TextStyle(
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                info[index]['time']!,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
        );
      },
    );
  }
}
