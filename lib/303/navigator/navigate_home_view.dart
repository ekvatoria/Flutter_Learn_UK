import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/mixin/navigator_mixin.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          router.pushToPage(NavigatorRoutesEnum.detail, arguments: "uk10");
          // await NavigatorManager.instance.pushToPage(NavigatorRoutesEnum.detail, arguments: "uk10");
          // Navigator.of(context).pushNamed(NavigatorRoutesEnum.detail.withParaf, arguments: "abc");
          // Navigator.of(context).pushNamed("/sdfsd", arguments: "abc");
        },
        child: const Icon(Icons.abc_rounded),
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: Container(),
    );
  }
}
