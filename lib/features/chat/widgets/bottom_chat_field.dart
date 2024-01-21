import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/common/utils/utils.dart';
import 'package:whatsapp_clone_flutter/features/chat/controller/chat_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  const BottomChatField({
    Key? key,
    required this.fillColor,
    required this.iconColor,
    required this.hintTextColor,
    required this.currentBrightness,
    required this.recieverUserId,
    // required this.isGroupChat,
  }) : super(key: key);

  final Color fillColor;
  final Color iconColor;
  final Color hintTextColor;
  final Brightness currentBrightness;
  final String recieverUserId;
  // final bool isGroupChat;

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  final TextEditingController messageController = TextEditingController();
  bool isShowSendButton = false;

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            messageController.text.trim(),
            widget.recieverUserId,
            // widget.isGroupChat,
          );
      setState(() {
        messageController.clear();
        isShowSendButton = !isShowSendButton;
      });
    }
    // else {
    //   var tempDir = await getTemporaryDirectory();
    //   var path = '${tempDir.path}/flutter_sound.aac';
    //   if (!isRecorderInit) {
    //     return;
    //   }
    //   if (isRecording) {
    //     await _soundRecorder!.stopRecorder();
    //     sendFileMessage(File(path), MessageEnum.audio);
    //   } else {
    //     await _soundRecorder!.startRecorder(
    //       toFile: path,
    //     );
    //   }

    //   setState(() {
    //     isRecording = !isRecording;
    //   });
    // }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.recieverUserId,
          messageEnum,
          // widget.isGroupChat,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              controller: messageController,
              onChanged: (val) {
                if (val.trim().isNotEmpty) {
                  setState(() {
                    isShowSendButton = true;
                  });
                } else {
                  setState(() {
                    isShowSendButton = false;
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.fillColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.emoji_emotions_outlined,
                      color: widget.iconColor),
                ),
                suffixIcon: !isShowSendButton
                    ? Container(
                        // color: Colors.yellow,
                        width: MediaQuery.of(context).size.width * 0.36,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {},
                              icon: Icon(
                                Icons.attach_file_rounded,
                                color: widget.iconColor,
                              ),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {},
                              icon: Icon(Icons.currency_rupee_rounded,
                                  color: widget.iconColor),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: selectImage,
                              icon: Icon(Icons.camera_alt_rounded,
                                  color: widget.iconColor),
                            ),
                          ],
                        ),
                      )
                    : IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () {},
                        icon: Icon(
                          Icons.attach_file_rounded,
                          color: widget.iconColor,
                        ),
                      ),
                hintText: 'Type a Message!',
                hintStyle: TextStyle(
                  color: widget.hintTextColor,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          ClipOval(
            child: Container(
              color: widget.currentBrightness == Brightness.light
                  ? const Color.fromRGBO(5, 94, 78, 1)
                  : const Color.fromARGB(201, 49, 186, 161),
              child: GestureDetector(
                onTap: () {
                  sendTextMessage();
                },
                child: !isShowSendButton
                    ? const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.mic,
                          color: Color.fromRGBO(237, 233, 233, 1),
                          size: 24,
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.send,
                          color: Color.fromRGBO(237, 233, 233, 1),
                          size: 24,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
