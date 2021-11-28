import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_cobalt/core/controllers/ThemeController.dart';
import 'package:provider/provider.dart';

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
    return Consumer(builder: (context, ThemeController themeController, child) {
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            DrawerListTile(
              isDark: themeController.isDark,
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashboard.svg",
              press: () {},
            ),
            DrawerListTile(
              isDark: themeController.isDark,
              title: "Library",
              svgSrc: "assets/icons/menu_library.svg",
              press: () {},
            ),
            DrawerListTile(
              isDark: themeController.isDark,
              title: "Works",
              svgSrc: "assets/icons/menu_pen.svg",
              press: () {},
            ),
            DrawerListTile(
              isDark: themeController.isDark,
              title: "Favorites",
              svgSrc: "assets/icons/menu_favorite.svg",
              press: () {},
            ),
            DrawerListTile(
              isDark: themeController.isDark,
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              widget: IconButton(
                icon: Icon(themeController.isDark
                    ? Icons.dark_mode
                    : Icons.light_mode),
                hoverColor: Colors.transparent,
                onPressed: () {
                  themeController.isDark
                      ? themeController.isDark = false
                      : themeController.isDark = true;
                },
              ),
              press: () {},
            ),
          ],
        ),
      );
    });
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
