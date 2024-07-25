import 'package:flutter/material.dart';
import 'package:yes_no/domain/entities/message.dart';

class TransmitterMessageBubble extends StatelessWidget {
  final Message message;
  const TransmitterMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        
        // const _ImageBubble(),
        // const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpngimg.com%2Fuploads%2Fgithub%2Fgithub_PNG90.png&f=1&nofb=1&ipt=074cdc5c6e8c5e2efc8a8e32379c555d00c8dbe44e7a199581dd906a70df3ab9&ipo=images',
          width: size.width * 0.5,
          height: 200,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }

            return Container(
              width: size.width * 0.5,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const CircularProgressIndicator(),
            );
          },
        ));
  }
}
