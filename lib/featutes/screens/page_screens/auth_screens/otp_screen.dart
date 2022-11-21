// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/featutes/auth/controller/auth_controller_riverpod.dart';
import 'package:whatsapp_clone/router.dart' as route;

import '../../../../core/common_widgets/ktext.dart';
import '../../../../core/constants/colors.dart';

class OTPScreen extends ConsumerWidget {
  final String verificationId;
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, userOTP, verificationId);
  }

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: KText(
              text: 'Verifying your phone number',
              size: 18,
              fontWeight: FontWeight.w600,
              color: whiteColor,
              textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route.landingScreen);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: KText(
                  text: 'We have sent an sms with a code',
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Center(
                  child: TextField(
                    onChanged: ((value) {
                      if (value.length == 6) {
                        verifyOTP(ref, context, value.trim());
                      }
                    }),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '- - - - - -',
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
