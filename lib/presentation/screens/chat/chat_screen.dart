import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/domain/entities/message.dart';
import 'package:yes_no/presentation/providers/chat_provider.dart';
import 'package:yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no/presentation/widgets/chat/transmitter_message_bubble.dart';
import 'package:yes_no/presentation/widgets/shared/messge_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fgithub%2Fgithub_PNG90.png&f=1&nofb=1&ipt=074cdc5c6e8c5e2efc8a8e32379c555d00c8dbe44e7a199581dd906a70df3ab9&ipo=images'),
          ),
        ),
        title: const Text('GitHub chat'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesLists.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesLists[index];
                  if (message.fromWho == FromWho.me) {
                    return MyMessageBubble(message: message);
                  } else {
                    return TransmitterMessageBubble(message: message);
                  }
                },
              ),
            ),
            MessgeFieldBox(
              onValue: (text) => {
                chatProvider.sendMessage(text),
              },
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
