import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/common_widgets/custom_button.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:whatsapp_clone/core/common_widgets/ktext.dart';
import 'package:whatsapp_clone/router.dart' as route;

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          const Center(
            child: KText(
                text: "Welcome to Whatsapp",
                size: 35,
                fontWeight: FontWeight.bold,
                color: null),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Image.asset(
            'images/landing.png',
            color: tabColor,
            height: 340,
            width: 340,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: KText(
                text:
                    "Read our Privacy Policy.Tap \"Agree and Continue\" to accept the Terms of Services",
                size: 14,
                fontWeight: FontWeight.w400,
                color: greColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: 300,
              child: CustomButton(
                  text: "AGREE AND CONTINUE",
                  onPressed: () {
                    Navigator.pushNamed(context, route.loginScreen);
                  })),
        ],
      )),
    );
  }
}
