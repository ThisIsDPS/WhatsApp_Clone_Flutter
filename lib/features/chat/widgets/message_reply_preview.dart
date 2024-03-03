import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/providers/message_reply_provider.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/display_text_image_gif.dart';

class MessageReplyPreview extends ConsumerWidget {
  const MessageReplyPreview({super.key});

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Brightness currentBrightness = Theme.of(context).brightness;
    final messageReply = ref.watch(messageReplyProvider);

    return messageReply == null
        ? const SizedBox()
        : Container(
            width: 330,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentBrightness == Brightness.light
                  ? const Color.fromARGB(255, 247, 247, 247)
                  : const Color.fromRGBO(31, 44, 52, 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        messageReply.isMe ? 'Me' : 'Opposite',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.close,
                        size: 16,
                      ),
                      onTap: () => cancelReply(ref),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: currentBrightness == Brightness.light
                        ? const Color.fromARGB(255, 235, 234, 234)
                        : const Color.fromARGB(255, 21, 34, 43).withOpacity(1),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DisplayTextImageGIF(
                    message: messageReply.message,
                    type: messageReply.messageEnum,
                  ),
                ),
              ],
            ),
          );
  }
}
