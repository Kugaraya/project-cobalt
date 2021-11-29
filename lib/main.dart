import 'package:google_fonts/google_fonts.dart';
import 'package:project_cobalt/constants.dart';
import 'package:project_cobalt/core/controllers/theme_controller.dart';
import 'package:project_cobalt/core/locator.dart';
import 'package:project_cobalt/core/providers.dart';
import 'package:project_cobalt/core/services/cache_service.dart';
import 'package:project_cobalt/core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocatorInjector.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  locator<NavigatorService>().createRoutes();
  locator<CacheService>().initValues();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      builder: (context, child) {
        final themeController = context.watch<ThemeController>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            Locale('en', ''),
          ],
          title: 'Project Cobalt',
          theme: themeController.isDark
              ? ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: bgColor,
                  textTheme:
                      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                          .apply(bodyColor: Colors.white),
                  canvasColor: secondaryColor,
                )
              : ThemeData.light().copyWith(
                  textTheme:
                      GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                          .apply(
                              bodyColor: Colors.blueGrey[900],
                              displayColor: Colors.blueGrey[900])),
          navigatorKey: locator<NavigatorService>().navigatorKey,
          onGenerateRoute: locator<NavigatorService>().generator,
          initialRoute: '/dashboard',
        );
      },
    );
  }
}
