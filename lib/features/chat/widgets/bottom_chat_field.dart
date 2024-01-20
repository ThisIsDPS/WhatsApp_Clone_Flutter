import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
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
  bool isTextFieldEmpty = true;

  void sendTextMessage() async {
    if (!isTextFieldEmpty) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            messageController.text.trim(),
            widget.recieverUserId,
            // widget.isGroupChat,
          );
      setState(() {
        messageController.text = '';
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

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {
        isTextFieldEmpty = messageController.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsetsDirectional.all(5),
          child: TextField(
            controller: messageController,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.emoji_emotions_outlined,
                    color: widget.iconColor),
              ),
              suffixIcon: isTextFieldEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.attach_file_rounded,
                              color: widget.iconColor,),
                          Icon(Icons.currency_rupee_rounded,
                              color: widget.iconColor),
                          Icon(Icons.camera_alt_rounded,
                              color: widget.iconColor),
                        ],
                      ))
                  : Icon(Icons.attach_file_rounded, color: widget.iconColor),
              hintText: 'Type a Message!',
              hintStyle: TextStyle(
                color: widget.hintTextColor,
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
            color: widget.currentBrightness == Brightness.light
                ? const Color.fromRGBO(5, 94, 78, 1)
                : const Color.fromARGB(201, 49, 186, 161),
            child: IconButton(
              icon: isTextFieldEmpty
                  ? const Icon(
                      Icons.mic,
                      color: Color.fromRGBO(237, 233, 233, 1),
                    )
                  : const Icon(
                      Icons.send,
                      color: Color.fromRGBO(237, 233, 233, 1),
                    ),
              onPressed: () {
                // Add your send message logic here
                print('In');
                sendTextMessage();

              },
            ),
          ),
        ),
      ],
    );
  }
}
