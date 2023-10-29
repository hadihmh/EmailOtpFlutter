import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/fonts.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/ui/widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_login_app/ui/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? language = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
              child: Column(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          CustomColors.firstColor,
                          CustomColors.secondColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds);
                    },
                    child: Image.network(
                      IconsUrl.logo,
                      color: Colors.black,
                      scale: 1.8,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.getFont(Fonts.josefin_sans,
                        letterSpacing: 3.0, color: Colors.black, fontSize: 18),
                    child: Text(
                      language!.sign_to_continue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: language.enter_email,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none // Set border radius here
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: language.enter_password,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none // Set border radius here
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: () {
                      Get.snackbar("Alert", "Coming soon....!");
                    },
                    size: Get.size.width * 0.4,
                    buttonText: language.login,
                    textColor: Colors.white,
                    gradient: LinearGradient(colors: <Color>[
                      CustomColors.firstColor,
                      CustomColors.secondColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.getFont(Fonts.josefin_sans,
                        fontSize: 16, color: Colors.black),
                    child: Text(language.lost_password),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SocialButton(
                        gradient: LinearGradient(
                            colors: [
                              CustomColors.firstColor,
                              CustomColors.secondColor
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft),
                        logo: IconsUrl.googleLogo,
                        textContent: "Google",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SocialButton(
                        gradient: LinearGradient(
                            colors: [
                              CustomColors.firstColor,
                              CustomColors.secondColor
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft),
                        logo: IconsUrl.facebookLogo,
                        textContent: "Facebook",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: language.dont_have_account,
                            style: GoogleFonts.getFont(
                              Fonts.josefin_sans,
                            )),
                        TextSpan(
                          text: language.register,
                          style: GoogleFonts.getFont(Fonts.josefin_sans,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
