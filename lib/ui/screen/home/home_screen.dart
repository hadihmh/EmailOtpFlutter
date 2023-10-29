import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/items.dart';
import 'package:my_login_app/controller/auth_page_controller.dart';
import 'package:my_login_app/controller/home_controller.dart';
import 'package:my_login_app/ui/screen/home/first_screen.dart';
import 'package:my_login_app/ui/screen/home/second_screen.dart';
import 'package:my_login_app/ui/screen/home/third_Screen.dart';
import 'package:my_login_app/ui/widgets/side_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());
  final AuthPageController authPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    AppLocalizations? language = AppLocalizations.of(context);

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                CustomColors.firstColor,
                CustomColors.secondColor
              ]))),
          actions: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: authPageController.changeLanguage,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Image.network(
                    authPageController.getCountryFlag,
                    scale: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: const SideMenu(),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: PageView(
                  controller: homeController.pageController.value,
                  children: const <Widget>[
                    FirstScreen(),
                    SecondScreen(),
                    ThirtScreen(),
                  ],
                  onPageChanged: (page) {
                    homeController.pageNumber.value = page;
                  },
                ),
              ),
              BottomBarInspiredInside(
                items: CustomItem.items,
                backgroundColor: Colors.white,
                color: CustomColors.secondColor,
                colorSelected: Colors.white,
                indexSelected: homeController.pageNumber.value,
                onTap: (int index) {
                  homeController.pageController.value.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  homeController.pageNumber.value = index;
                },
                chipStyle: const ChipStyle(convexBridge: true),
                itemStyle: ItemStyle.hexagon,
                animated: false,
              ),
            ],
          ),
        ));
  }
}
