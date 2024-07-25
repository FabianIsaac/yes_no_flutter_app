import 'package:flutter/material.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  final List<Message> messagesLists = [
    Message(text: 'Hola hola', fromWho: FromWho.me),
    Message(text: 'Hola hola, que talca?', fromWho: FromWho.other),
  ];

  Future<void> sendMessage(String text, FromWho fromWho) async {
    if (text.isEmpty) return;

    messagesLists.add(Message(text: text, fromWho: fromWho));
    scrollToBottom();
    notifyListeners();
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
  }
}
