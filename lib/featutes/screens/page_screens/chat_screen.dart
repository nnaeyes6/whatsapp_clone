import 'package:flutter/material.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/layout_screens/mobile_chat_screen.dart';

@immutable
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //if (kIsWeb) {
    //  return const WebLayoutScreen();
    //} else {
      return const MobileChatScreen();
    //}
  }
}
