import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:retoiventas/Model/message.dart';

class FirebaseApi {
  static Future uploadMessage(String text, String uid) async {
    final DateTime date = DateTime.now();
    print(text);
    final refMessages = FirebaseFirestore.instance
        .collection('chats')
        .doc('messages')
        .collection('content');
    final newMessage =
        ChatMessage(messageContent: text, messageType: uid, date: date);
    refMessages.add(newMessage.toJson());
  }
}
