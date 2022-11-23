import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/layout_screens/mobile_layout_screen.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/layout_screens/web_layout_screen.dart';

@immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const WebLayoutScreen();
    } else {
      return const MobileLayoutScreen();
    }
  }
}
