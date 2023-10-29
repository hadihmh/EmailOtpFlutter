import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/fonts.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/controller/auth_page_controller.dart';
import 'package:my_login_app/ui/screen/home/home_screen.dart';
import 'package:my_login_app/ui/widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_login_app/ui/widgets/timer_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.displaySmall?.copyWith(color: color);
  }

  AuthPageController authPageController = Get.find();
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
              // Obx(() => null)
              child: Obx(
            () => Padding(
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
                      IconsUrl.otpLogo,
                      color: Colors.black,
                      scale: 0.8,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.getFont(Fonts.josefin_sans,
                        letterSpacing: 3.0, color: Colors.black, fontSize: 18),
                    child: Text(
                      language!.enter_otp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      numberOfFields: 5,
                      borderColor: CustomColors.accentPurpleColor,
                      focusedBorderColor: CustomColors.accentPurpleColor,
                      styles: [
                        createStyle(CustomColors.accentPurpleColor),
                        createStyle(CustomColors.accentYellowColor),
                        createStyle(CustomColors.accentDarkGreenColor),
                        createStyle(CustomColors.accentOrangeColor),
                        createStyle(CustomColors.accentPinkColor),
                      ],
                      showFieldAsBox: false,
                      borderWidth: 4.0,

                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        authPageController.otpFilled.value = false;

                        print(code);
                        //handle validation or checks here if necessary
                      },

                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        authPageController.otpFilled.value = true;
                        authPageController.otpCode.value = verificationCode;
                        // print(verificationCode);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Opacity(
                    opacity: authPageController.otpFilled.value ? 1 : 0.4,
                    child: CustomButton(
                      isLoading: authPageController.getPageLoading,
                      onTap: () async {
                        if (authPageController.otpFilled.value) {
                          if (await authPageController.verifyOtp(
                              authPageController.emailTextController.value.text,
                              authPageController.otpCode.value)) {
                            Get.off(HomeScreen());
                          }
                        }
                      },
                      size: Get.size.width * 0.7,
                      buttonText: language.verify,
                      textColor: Colors.white,
                      gradient: LinearGradient(
                          colors: <Color>[
                            CustomColors.firstColor,
                            CustomColors.secondColor
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTimerButton(
                    onTap: () async {
                      if (await authPageController.register(
                          authPageController.emailTextController.value.text)) {
                        Get.snackbar(language.successful, language.code_sent);
                      }
                    },
                    size: Get.size.width * 0.4,
                    buttonText: language.retry,
                    textColor: Colors.white,
                    gradient: LinearGradient(colors: <Color>[
                      CustomColors.firstColor,
                      CustomColors.secondColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: language.edit_email,
                          style: GoogleFonts.getFont(Fonts.josefin_sans,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
