import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/common_widgets/default_error_screen.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/auth_screens/login_screens.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/landing_screens.dart';
import 'featutes/screens/page_screens/layout_screens/mobile_layout_screen.dart';

const String loginScreen = 'login-screen';
const String landingScreen = 'landing-screen';
const String mobileLayoutScreen = 'mobile-layout-screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case landingScreen:
      return MaterialPageRoute(builder: (context) => const LandingScreen());
    case mobileLayoutScreen:
      return MaterialPageRoute(
          builder: (context) => const MobileLayoutScreen());
    default:
      return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: DefaultErrorScreen(error: 'This Screen does not exist'),
            )),
      );
  }
}
