import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/fonts.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/controller/auth_page_controller.dart';
import 'package:my_login_app/ui/screen/login/login_screen.dart';
import 'package:my_login_app/ui/screen/login/register_screen.dart';
import 'package:my_login_app/ui/widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_login_app/ui/widgets/logo_app.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final AuthPageController authPageController = Get.put(AuthPageController());

  @override
  Widget build(BuildContext context) {
    AppLocalizations? language = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
          child: Obx(() => Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      CustomColors.firstColor,
                      CustomColors.secondColor
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: authPageController.changeLanguage,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Image.network(
                          authPageController.getCountryFlag,
                          scale: 1.3,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            IconsUrl.logo,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          DefaultTextStyle(
                            style: GoogleFonts.getFont(
                                Fonts.sedgwick_ave_display,
                                letterSpacing: 3.0,
                                color: Colors.white70,
                                fontSize: 18),
                            child: Text(language!.welcome_to),
                          ),
                          const LogoOfApp(),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            onTap: () {
                              Get.to(const LoginScreen());
                            },
                            buttonText: language.login,
                            size: Get.size.width * 0.3,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            buttonText: language.register,
                            size: Get.size.width * 0.5,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultTextStyle(
                            style: GoogleFonts.getFont(Fonts.josefin_sans,
                                color: Colors.white70, fontSize: 16),
                            child: Text(
                              language.or_quick_login_with_touch_id,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Image.network(
                            IconsUrl.fingerPrint,
                            scale: 1.1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
