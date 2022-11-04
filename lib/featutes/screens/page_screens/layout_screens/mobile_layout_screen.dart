import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:whatsapp_clone/featutes/screens/screen_widgets/contact_lists.dart';

class MobileLayoutScreen extends StatelessWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            title: const Text(
              'Whatsapp',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
            bottom: TabBar(
                indicatorWeight: 4,
                labelColor: tabColor,
                indicatorColor: tabColor,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.w800),
                tabs: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text('CHATS')),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text('STATUS')),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text('CALLS')),
                ]),
          ),
          body: const ContactsLists(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {},
            child: const Icon(
              Icons.comment,
              color: Colors.white,
            ),
          ),
        ));
  }
}
