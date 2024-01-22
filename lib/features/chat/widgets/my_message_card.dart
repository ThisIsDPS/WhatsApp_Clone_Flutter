import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/display_text_image_gif.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;

  const MyMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          maxHeight: MediaQuery.of(context).size.height * 0.4,
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
                child: DisplayTextImageGIF(
                  message: message,
                  type: type,
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
                      Icons.done_all_rounded,
                      size: 22,
                      color: currentBrightness == Brightness.light
                          ? type == MessageEnum.text
                              ? Colors.grey.shade700
                              : Colors.white
                          : Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
