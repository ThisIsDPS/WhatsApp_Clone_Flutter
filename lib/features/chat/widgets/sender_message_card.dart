import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/display_text_image_gif.dart';

class SenderMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;

  const SenderMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
  });

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;
    Brightness currentBrightness = Theme.of(context).brightness;

    return SwipeTo(
      onRightSwipe: (details) {
        onRightSwipe();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            color: currentBrightness == Brightness.light
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromRGBO(31, 44, 52, 1),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.02,
                          right: MediaQuery.of(context).size.width * 0.06,
                          top: MediaQuery.of(context).size.width * 0.02,
                        )
                      : const EdgeInsetsDirectional.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isReplying) ...[
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: currentBrightness == Brightness.light
                                ? const Color.fromARGB(232, 227, 227, 227)
                                    .withOpacity(0.8)
                                : const Color.fromARGB(27, 155, 217, 163)
                                    .withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: DisplayTextImageGIF(
                            message: repliedText,
                            type: repliedMessageType,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      DisplayTextImageGIF(
                        message: message,
                        type: type,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: type == MessageEnum.text ? 6 : 10,
                  right: type == MessageEnum.text ? 10 : 16,
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: currentBrightness == Brightness.light
                          ? type == MessageEnum.text
                              ? Colors.grey.shade800
                              : Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
