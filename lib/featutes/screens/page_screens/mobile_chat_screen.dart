import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:whatsapp_clone/info/info.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/my_message.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/sender_msg.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          info[0]['name'].toString(),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: ((context, index) {
                if (messages[index]['isMe'] == true) {
                  return MyMessagesCard(
                    message: messages[index]['text'].toString(),
                    date: messages[index]['time'].toString(),
                  );
                }
// SenderMessage => Card
                return SenderMessagesCard(
                  message: messages[index]['text'].toString(),
                  date: messages[index]['time'].toString(),
                );
              }),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: mobileChatBoxColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.emoji_emotions,
                    color: Colors.grey,
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_file, color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.money, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              hintText: 'message',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
