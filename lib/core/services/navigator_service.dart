import 'package:project_cobalt/core/base/base_service.dart';
import 'package:project_cobalt/screens/main/dashboard_display.dart';
import 'package:project_cobalt/screens/main/library_display.dart';
import 'package:seafarer/seafarer.dart';

import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  static final seafarer = Seafarer();
  final GlobalKey<NavigatorState>? navigatorKey = seafarer.navigatorKey;
  final generator = seafarer.generator();

  void createRoutes() {
    seafarer.addRoutes([
      // Just for good measure, we won't explicitly navigate to the InitialPage.
      SeafarerRoute(
        name: "/dashboard",
        builder: (context, args, params) {
          return DashboardDisplay();
        },
      ),
      SeafarerRoute(
        name: "/library",
        builder: (context, args, params) {
          return LibraryDisplay();
        },
      ),
    ]);
  }

  void navigateTo<T>(String pageRoute,
      {NavigationType? navigationType,
      Map<String, dynamic>? params,
      Duration? transitionDuration,
      List<SeafarerTransition>? transition,
      Curve? transitionCurve}) async {
    print('navigateTo: pageRoute - $pageRoute');

    seafarer.navigate(pageRoute,
        params: params != null ? params : null,
        transitionDuration: transitionDuration != null
            ? transitionDuration
            : Duration(milliseconds: 600),
        navigationType: navigationType != null ? navigationType : NavigationType.push,
        transitions: transition != null
            ? transition
            : [SeafarerTransition.fade_in, SeafarerTransition.fade_in],
        transitionCurve: transitionCurve != null ? transitionCurve : Curves.ease,
        removeUntilPredicate:
            navigationType == NavigationType.pushAndRemoveUntil
                ? (route) => false
                : null);
  }
}
