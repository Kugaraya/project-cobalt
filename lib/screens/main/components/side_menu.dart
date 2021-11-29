import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_cobalt/core/controllers/theme_controller.dart';
import 'package:project_cobalt/core/services/navigator_service.dart';
import 'package:provider/provider.dart';
import 'package:seafarer/seafarer.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
          ),
          DrawerListTile(
            isDark: Provider.of<ThemeController>(context).isDark,
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () => Provider.of<NavigatorService>(context, listen: false).navigateTo(
              '/dashboard',
              navigationType: NavigationType.popAndPushNamed
            ) ,
          ),
          DrawerListTile(
            isDark: Provider.of<ThemeController>(context).isDark,
            title: "Library",
            svgSrc: "assets/icons/menu_library.svg",
            press: () => Provider.of<NavigatorService>(context, listen: false).navigateTo(
              '/library',
              navigationType: NavigationType.popAndPushNamed
            ),
          ),
          DrawerListTile(
            isDark: Provider.of<ThemeController>(context).isDark,
            title: "Works",
            svgSrc: "assets/icons/menu_pen.svg",
            press: () {},
          ),
          DrawerListTile(
            isDark: Provider.of<ThemeController>(context).isDark,
            title: "Favorites",
            svgSrc: "assets/icons/menu_favorite.svg",
            press: () {},
          ),
          DrawerListTile(
            isDark: Provider.of<ThemeController>(context).isDark,
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            widget: IconButton(
              icon: Icon(Provider.of<ThemeController>(context).isDark
                  ? Icons.dark_mode
                  : Icons.light_mode),
              hoverColor: Colors.transparent,
              onPressed: () {
                Provider.of<ThemeController>(context, listen: false).isDark
                    ? Provider.of<ThemeController>(context, listen: false).isDark = false
                    : Provider.of<ThemeController>(context, listen: false).isDark = true;
              },
            ),
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      required this.isDark,
      required this.title,
      required this.svgSrc,
      required this.press,
      this.widget})
      : super(key: key);
  final bool isDark;
  final String title, svgSrc;
  final VoidCallback press;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: !isDark ? Colors.blueGrey[900] : Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: !isDark ? Colors.blueGrey[900] : Colors.white54),
      ),
      trailing: widget,
    );
  }
}
