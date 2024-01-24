// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/common/utils/utils.dart';
import 'package:whatsapp_clone_flutter/features/chat/controller/chat_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  const BottomChatField({
    super.key,
    required this.fillColor,
    required this.iconColor,
    required this.hintTextColor,
    required this.currentBrightness,
    required this.recieverUserId,
    // required this.isGroupChat,
  });

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
  FlutterSoundRecorder? soundRecorder;
  bool isRecorderInit = false;
  bool isRecording = false;
  bool isShowSendButton = false;
  bool isShowEmojiContainer = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    soundRecorder = FlutterSoundRecorder();
    openAudio();
  }

  void openAudio() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Mic permission not allowed!');
    }
    await soundRecorder!.openRecorder();
    isRecorderInit = true;
  }

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
    } else {
      var tempDir = await getTemporaryDirectory();
      var path = '${tempDir.path}/flutter_sound.aac';
      if (!isRecorderInit) {
        return;
      }
      if (isRecording) {
        await soundRecorder!.stopRecorder();
        sendFileMessage(File(path), MessageEnum.audio);
      } else {
        await soundRecorder!.startRecorder(
          toFile: path,
        );
      }

      setState(() {
        isRecording = !isRecording;
      });
    }
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

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  void selectGIF() async {
    final gif = await pickGIF(context);
    if (gif != null) {
      ref.read(chatControllerProvider).sendGIFMessage(
            context,
            gif.url,
            widget.recieverUserId,
            // widget.isGroupChat,
          );
    }
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    soundRecorder!.closeRecorder();
    isRecorderInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  // maxLines: null,
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
                    prefixIcon: Container(
                      // color:  Colors.red,
                      width: isShowEmojiContainer
                          ? MediaQuery.of(context).size.width * 0
                          : MediaQuery.of(context).size.width * 0.24,
                      padding: const EdgeInsets.only(left: 2),
                      child: isShowEmojiContainer
                          ? IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: () {
                                setState(() {
                                  isShowEmojiContainer = false;
                                  showKeyboard();
                                });
                              },
                              icon: Icon(Icons.keyboard_alt_rounded,
                                  color: widget.iconColor),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: toggleEmojiKeyboardContainer,
                                  icon: Icon(Icons.emoji_emotions_outlined,
                                      color: widget.iconColor),
                                ),
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: selectGIF,
                                  icon: Icon(Icons.gif_rounded,
                                      color: widget.iconColor),
                                  style: IconButton.styleFrom(
                                    iconSize: 34,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    suffixIcon: !isShowSendButton
                        ? Container(
                            // color: Colors.yellow,
                            width: MediaQuery.of(context).size.width * 0.34,
                            padding: const EdgeInsets.only(right: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: selectVideo,
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
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
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: isRecording
                                ? const Icon(
                                    Icons.close,
                                    color: Color.fromRGBO(237, 233, 233, 1),
                                    size: 24,
                                  )
                                : const Icon(
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
          isShowEmojiContainer
              ? SizedBox(
                  height: 310,
                  child: EmojiPicker(
                    config: Config(
                      columns: 8,
                      emojiSizeMax: Platform.isIOS ? 30 : 24,
                    ),
                    onEmojiSelected: ((category, emoji) {
                      setState(() {
                        messageController.text =
                            messageController.text + emoji.emoji;
                      });

                      if (!isShowSendButton) {
                        setState(() {
                          isShowSendButton = true;
                        });
                      }
                    }),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
