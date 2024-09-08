import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paragfg = "/";

  final items = {
    paragfg: (context) => const LottieLearn(),
    NavigatorRoutesEnum.home.withParaf: (context) => const NavigateHomeView(),
    NavigatorRoutesEnum.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigatorRoutesEnum { init, home, detail }

extension NavigatorRoutesExtension on NavigatorRoutesEnum {
  String get withParaf => "/$name";
}
