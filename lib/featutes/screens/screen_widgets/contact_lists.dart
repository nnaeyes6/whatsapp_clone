import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:whatsapp_clone/info/info.dart';

import '../page_screens/mobile_chat_screen.dart';

class ContactsLists extends StatelessWidget {
  const ContactsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: info.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MobileChatScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SingleChildScrollView(
                    child: ListTile(
                      title: Text(
                        info[index]['name'].toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          info[index]['message'].toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          info[index]['profilePic'].toString(),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          info[index]['time'].toString(),
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: dividerColor,
                indent: 90,
              )
            ],
          );
        }),
      ),
    );
  }
}
