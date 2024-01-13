import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/models/info.dart';
import 'package:whatsapp_clone_flutter/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          info[0]['name']!,
          style: const TextStyle(fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
            const Expanded(
              child: ChatList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: const EdgeInsetsDirectional.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                            Icon(Icons.emoji_emotions_outlined, color: iconColor),
                      ),
                      suffixIcon: Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.attach_file_rounded, color: iconColor),
                            Icon(Icons.currency_rupee_rounded, color: iconColor),
                            Icon(Icons.camera_alt_rounded, color: iconColor),
                          ],
                        ),
                      ),
                      hintText: 'Type a Message!',
                      hintStyle: TextStyle(
                        color: hintTextColor,
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Container(
                    color: currentBrightness == Brightness.light
                        ? const Color.fromRGBO(5, 94, 78, 1)
                        : const Color.fromARGB(201, 49, 186, 161),
                    child: IconButton(
                      icon: const Icon(
                        Icons.mic,
                        color: Color.fromRGBO(237, 233, 233, 1),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
