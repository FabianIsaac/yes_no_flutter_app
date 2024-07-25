import 'package:flutter/material.dart';

class MessgeFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessgeFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme.primary;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'Escribe un mensaje',
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: Icon(
          Icons.send,
          color: color,
        ),
        onPressed: () {
          final message = textController.value.text;
          onValue(message);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
