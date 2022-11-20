import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/core/common_widgets/custom_button.dart';
import 'package:whatsapp_clone/core/common_widgets/ktext.dart';
import 'package:whatsapp_clone/core/constants/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone/core/utils/util_snackbar.dart';
import 'package:whatsapp_clone/featutes/auth/controller/auth_controller_riverpod.dart';
import 'package:whatsapp_clone/router.dart' as route;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country? countries;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void countryPickerSelection() {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        setState(() {
          countries = country;
        });
        // print('Select country: ${_country.displayName}');
      },
    );
  }

  void sendOTP() {
    String phoneNumber = phoneController.text.trim();
    if (countries != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhoneNum(context, '+ ${countries!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'fill in all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: KText(
            text: 'Enter your phone number',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: KText(
                  text: 'Whatsapp will need to verify your phone number',
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: countryPickerSelection,
                child: const KText(
                    text: 'Pick Country',
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  if (countries != null)
                    KText(
                        text: '+${countries!.phoneCode}',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: null),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: 'phone number',
                        ),
                      )),
                ],
              ),
              SizedBox(height: size.height * 0.5),
              SizedBox(
                width: 90,
                child: CustomButton(text: 'NEXT', onPressed: sendOTP),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
