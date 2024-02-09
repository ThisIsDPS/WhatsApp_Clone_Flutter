import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/widgets/loader.dart';
import 'package:whatsapp_clone_flutter/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone_flutter/features/call/controller/call_controller.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/bottom_chat_field.dart';
import 'package:whatsapp_clone_flutter/models/user_model.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  final bool isGroupChat;
  final String profilePic;

  const MobileChatScreen({
    super.key,
    required this.name,
    required this.uid,
    required this.isGroupChat,
    required this.profilePic,
  });

  void makeCall(WidgetRef ref, BuildContext context) {
    ref.read(callControllerProvider).makeCall(
          context,
          name,
          uid,
          profilePic,
          isGroupChat,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Brightness currentBrightness = Theme.of(context).brightness;

    Color iconColor;
    Color hintTextColor;
    Color fillColor;

    if (currentBrightness == Brightness.light) {
      iconColor = Colors.grey.shade700;
      hintTextColor = Colors.grey.shade700;
      fillColor = const Color.fromARGB(255, 247, 247, 247);
    } else {
      iconColor = Colors.white70;
      hintTextColor = Colors.white70;
      fillColor = const Color.fromRGBO(31, 44, 52, 1);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 248, 245, 245),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: isGroupChat
            ? Text(name)
            : StreamBuilder<UserModel>(
                stream: ref.read(authControllerProvider).userDataById(uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        snapshot.data!.isOnline ? 'online' : 'offline',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  );
                }),
        actions: [
          IconButton(
            onPressed: () => makeCall(ref, context),
            icon: const Icon(Icons.videocam),
            iconSize: 28,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: ChatList(
                recieverUserId: uid,
                isGroupChat: isGroupChat,
              ),
            ),
            BottomChatField(
              fillColor: fillColor,
              iconColor: iconColor,
              hintTextColor: hintTextColor,
              currentBrightness: currentBrightness,
              recieverUserId: uid,
              isGroupChat: isGroupChat,
            ),
          ],
        ),
      ),
    );
  }
}
