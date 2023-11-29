import 'package:flutter/material.dart';

class ChatBubbles extends StatelessWidget {
  final String message;

  const ChatBubbles({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Text(
        message,
        style: const TextStyle(color:Colors.white,fontSize: 16),
      ),
    );
  }
}