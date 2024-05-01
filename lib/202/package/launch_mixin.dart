import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchURL(String url) async {
    if (await launch(url)) throw 'Could not launch $url';
  }
}
