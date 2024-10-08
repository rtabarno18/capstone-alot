import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: ListView(
        children: List.generate(
            10,
            (index) => ListTile(
                  title: Text('Message $index'),
                  subtitle: const Text('Message content here'),
                )),
      ),
    );
  }
}
