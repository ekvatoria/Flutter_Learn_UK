import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_mixin.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
            onPressed: () {
              launchURL('https://pub.dev/packages/url_launcher');
            }),
        body: const LoadingBar());
  }
}
