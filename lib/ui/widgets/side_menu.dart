import 'package:flutter/material.dart';
import 'package:my_login_app/constant/colors.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/ui/widgets/drawer_list.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? language = AppLocalizations.of(context);

    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                child: Image.network(
              IconsUrl.drawerHeader,
            )),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: language!.overview,
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: language.course,
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.folder,
            title: language.resource,
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.chat,
            title: language.message,
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.settings,
            title: language.settings,
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: CustomColors.kLightBlue,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(language.upgrade_your_plan,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(language.go_to_pro,
                        style: TextStyle(color: CustomColors.kDarkBlue)),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.kDarkBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: CustomColors.kDarkBlue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
