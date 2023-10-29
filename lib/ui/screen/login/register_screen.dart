import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/fonts.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/controller/auth_page_controller.dart';
import 'package:my_login_app/ui/screen/login/otp_screen.dart';
import 'package:my_login_app/ui/widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_login_app/ui/widgets/social_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final AuthPageController authPageController = Get.find();

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
              child: Form(
                key: authPageController.formKey,
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
                          letterSpacing: 3.0,
                          color: Colors.black,
                          fontSize: 18),
                      child: Text(
                        language!.register_to_continue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.black),
                      controller: authPageController.emailTextController.value,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: language.enter_email,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:
                                BorderSide.none // Set border radius here
                            ),
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return language.enter_email;
                          } else if (!authPageController.emailRegex
                              .hasMatch(value)) {
                            return language.invalid_email;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => CustomButton(
                        onTap: () async {
                          if (authPageController.validateAndSave()) {
                            if (await authPageController.register(
                                authPageController
                                    .emailTextController.value.text)) {
                              Get.off(const OtpScreen());
                            }
                          }
                        },
                        isLoading: authPageController.getPageLoading,
                        size: Get.size.width * 0.7,
                        buttonText: language.register,
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
                      height: 80,
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
                              text: language.do_you_have_an_account,
                              style: GoogleFonts.getFont(
                                Fonts.josefin_sans,
                              )),
                          TextSpan(
                            text: language.login,
                            style: GoogleFonts.getFont(Fonts.josefin_sans,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
