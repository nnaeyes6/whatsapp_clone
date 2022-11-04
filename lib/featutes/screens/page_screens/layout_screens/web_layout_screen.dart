import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:whatsapp_clone/info/info.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/contact_lists.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/my_message.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/sender_msg.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/web_chat_appbar.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/web_profile_bar.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/web_search_bar.dart';

class WebLayoutScreen extends StatelessWidget {
  const WebLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                WebProfileBar(),
                WebSearchBar(),
                ContactsLists(),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/backgroundImage.png'),
            ),
          ),
          child: Column(
            children: [
              const WebChatAppBar(),
              // ChatList
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
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: chatBarMessage,
                  border: Border(
                    bottom: BorderSide(color: dividerColor),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            fillColor: searchBarColor,
                            filled: true,
                            hintStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(left: 20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
