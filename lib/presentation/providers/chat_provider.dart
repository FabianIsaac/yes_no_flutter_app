import 'package:flutter/material.dart';
import 'package:yes_no/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messagesLists = [
    Message(text: 'Iniciando chat', fromWho: FromWho.me),
    Message(
        text:
            'Recuerda que para obtener una respuesta, debes hacer una pregunta cerrada!',
        fromWho: FromWho.me),
  ];

  Future<void> reply() async {
    final message = await GetYesNoAnswer().getAnswer();
    messagesLists.add(message);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    messagesLists.add(Message(text: text, fromWho: FromWho.me));

    if (text.endsWith('?')) {
      reply();
    }

    notifyListeners();

    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
