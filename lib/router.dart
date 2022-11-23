import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/core/common_widgets/default_error_screen.dart';
import 'package:whatsapp_clone/featutes/auth/controller/auth_controller_riverpod.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/auth_screens/login_screens.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/auth_screens/otp_screen.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/auth_screens/user_info_screen.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/landing_screens.dart';
import 'package:whatsapp_clone/featutes/screens/page_screens/layout_screens/mobile_chat_screen.dart';
import 'package:whatsapp_clone/model/user_model.dart';

import 'featutes/screens/page_screens/layout_screens/mobile_layout_screen.dart';

const String _loginScreen = 'login-screen';
const String _landingScreen = 'landing-screen';
const String _homeScreen = 'home-screen';
const String _chatScreen = 'chat-screen';
const String _otpScreen = 'opt-screen';
const String _userInformationScreen = 'user-info-screen';

extension NavigationState on NavigatorState {
  void clearAndNavigateToLanding() {
    pushNamedAndRemoveUntil(_landingScreen, (route) => false);
  }

  void clearAndNavigateToHome() {
    pushNamedAndRemoveUntil(_homeScreen, (route) => false);
  }
}

extension NavigationContext on BuildContext {
  void navigateToLogin() {
    Navigator.of(this).pushNamed(_loginScreen);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void clearToHome() {
    Navigator.of(this).popUntil(
      (route) => route.settings.name == _landingScreen,
    );
  }

  void navigateToMobileLayout() {
    Navigator.of(this).pushNamedAndRemoveUntil(_homeScreen, (route) => false);
  }

  void navigateToChat() {
    Navigator.of(this).pushNamed(_chatScreen);
  }

  void navigateToOTP(String verificationId) {
    Navigator.of(this).pushNamed(_otpScreen, arguments: verificationId);
  }

  void navigateToUserInfo() {
    Navigator.of(this).pushNamedAndRemoveUntil(_userInformationScreen, (route) => false);
  }
}

String initialRoute(WidgetRef ref) {
  final userData = ref.read(userDataAuthProvider);
  return userData == UserModel.none ? _landingScreen : _homeScreen;
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => _pageBuilder(settings),
  );
}

Widget _pageBuilder(RouteSettings settings) {
  switch (settings.name) {
    case _loginScreen:
      return const LoginScreen();
    case _landingScreen:
      return const LandingScreen();
    case _homeScreen:
      return const MobileLayoutScreen();
    case _chatScreen:
      return const MobileChatScreen();
    case _otpScreen:
      final verificationId = settings.arguments as String;
      return OTPScreen(verificationId: verificationId);
    case _userInformationScreen:
      return const UserInformationScreen();
    default:
      return const Scaffold(
        body: DefaultErrorScreen(error: 'This Screen does not exist'),
      );
  }
}
