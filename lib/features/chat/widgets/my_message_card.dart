import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/display_text_image_gif.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onLeftSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;
  final bool isSeen;

  const MyMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
    required this.onLeftSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.isSeen,
  });

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;
    Brightness currentBrightness = Theme.of(context).brightness;

    return SwipeTo(
      onLeftSwipe: (details) {
        onLeftSwipe();
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.3,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            // maxHeight: MediaQuery.of(context).size.height * 0.3,
            minHeight: MediaQuery.of(context).size.height * 0.08,
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            color: currentBrightness == Brightness.light
                ? const Color.fromRGBO(187, 240, 195, 1)
                : const Color.fromRGBO(8, 105, 87, 0.992),
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
                                ? const Color.fromARGB(27, 155, 217, 163)
                                    .withOpacity(0.8)
                                : const Color.fromARGB(47, 3, 61, 51)
                                    .withOpacity(0.4),
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
                  bottom: type == MessageEnum.text ? 4 : 10,
                  right: type == MessageEnum.text ? 10 : 16,
                  child: Row(
                    children: [
                      Text(
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
                      const SizedBox(width: 5),
                      Icon(
                        isSeen ? Icons.done_all_rounded : Icons.done,
                        size: 22,
                        color: currentBrightness == Brightness.light
                            ? type == MessageEnum.text
                                ? isSeen
                                    ? Colors.blue
                                    : Colors.grey.shade700
                                : isSeen
                                    ? Colors.blue
                                    : Colors.white
                            : isSeen
                                ? Colors.blue
                                : Colors.white,
                      ),
                    ],
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
