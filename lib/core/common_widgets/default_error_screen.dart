import 'package:flutter/material.dart';

class DefaultErrorScreen extends StatelessWidget {
  final String error;
  const DefaultErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
