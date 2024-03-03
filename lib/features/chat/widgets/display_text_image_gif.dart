import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/video_player_item.dart';

class DisplayTextImageGIF extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayTextImageGIF({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();

    return type == MessageEnum.text
        ? Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: currentBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          )
        : type == MessageEnum.audio
            ? StatefulBuilder(builder: (context, setState) {
                return IconButton(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      await audioPlayer.play(UrlSource(message));
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                  ),
                );
              })
            : type == MessageEnum.video
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: VideoPlayerItem(
                      videoUrl: message,
                    ),
                  )
                : type == MessageEnum.gif
                    ? ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl: message,
                        ),
                      )
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl: message,
                        ),
                      );
  }
}
