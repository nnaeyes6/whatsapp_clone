import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(color: dividerColor)),
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: searchBarColor,
          filled: true,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          hintText: 'Search or start a new chat',
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
    );
  }
}
