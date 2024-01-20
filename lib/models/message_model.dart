import 'package:whatsapp_clone_flutter/common/enums/message_enum.dart';

class MessageModel {
  final String senderId;
  final String recieverId;
  final String text;
  final MessageEnum type;
  final DateTime timeSent;
  final String messageId;
  final bool isSeen;
  // final String repliedMessage;
  // final String repliedTo;
  // final MessageEnum repliedMessageType;

  MessageModel({
    required this.senderId,
    required this.recieverId,
    required this.text,
    required this.type,
    required this.timeSent,
    required this.messageId,
    required this.isSeen,
    // required this.repliedMessage,
    // required this.repliedTo,
    // required this.repliedMessageType,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'recieverid': recieverId,
      'text': text,
      'type': type.type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
      'isSeen': isSeen,
      // 'repliedMessage': repliedMessage,
      // 'repliedTo': repliedTo,
      // 'repliedMessageType': repliedMessageType.type,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] ?? '',
      recieverId: map['recieverid'] ?? '',
      text: map['text'] ?? '',
      type: (map['type'] as String).toEnum(),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      messageId: map['messageId'] ?? '',
      isSeen: map['isSeen'] ?? false,
      // repliedMessage: map['repliedMessage'] ?? '',
      // repliedTo: map['repliedTo'] ?? '',
      // repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
    );
  }
}