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
    final messageReply = ref.watch(messageReplyProvider);

    return messageReply == null
        ? const SizedBox()
        : Container(
            width: 330,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 247, 247, 247),
              borderRadius: BorderRadius.only(
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
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 234, 234),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
