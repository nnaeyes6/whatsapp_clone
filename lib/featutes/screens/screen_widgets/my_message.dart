// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whatsapp_clone/core/constants/colors.dart';

class MyMessagesCard extends StatelessWidget {
  final String message;
  final String date;

  const MyMessagesCard({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: messageColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 30, left: 10, bottom: 20),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 13),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.done_all,
                        size: 20,
                        color: Colors.white60,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
