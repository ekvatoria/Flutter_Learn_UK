import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/main.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }

    // ignore: no_leading_underscores_for_local_identifiers
    final _routes = routeSettings.name == NavigatorRoutes.paragfg
        ? NavigatorRoutesEnum.init
        : NavigatorRoutesEnum.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {
      case NavigatorRoutesEnum.init:
        return _navigateToNormal(const LottieLearn());
      case NavigatorRoutesEnum.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigatorRoutesEnum.detail:
        final id = routeSettings.arguments;
        return _navigateToNormal(NavigateHomeDetail(id: id is String ? id : null), isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}
