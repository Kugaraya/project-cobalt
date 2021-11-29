import 'package:project_cobalt/core/controllers/menu_controller.dart';
import 'package:project_cobalt/core/controllers/theme_controller.dart';
import 'package:project_cobalt/core/services/cache_service.dart';
import 'package:provider/single_child_widget.dart';

import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
    Provider.value(value: locator<CacheService>()),
  ];

  static List<SingleChildWidget> _dependentServices = [
  ];
  
  static List<SingleChildWidget> _consumableServices = [
    ChangeNotifierProvider<MenuController>(
      create: (_) => MenuController(),
    ),
    ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(),
    ),
  ];
}
