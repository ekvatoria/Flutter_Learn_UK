import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  bool isLight = false;
  late AnimationController controller;
  final lottieAstranaut = 'https://lottie.host/bd09caad-079d-4de2-9d80-98ef378fc70b/gl2ci04O8H.json';
  final lottieColorLoading = 'https://lottie.host/473b26b2-bdd8-4528-91b0-791c5be29c3d/z6ZSWd4QSa.json';

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.50 : 1);
              // controller.animateTo(0.30);
              // context.read<ThemeNotifier>().changeTheme;
              isLight = !isLight;
              Future.microtask(
                () {
                  context.read<ThemeNotifier>().changeTheme();
                },
              );
            },
            child: LottieBuilder.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          )
        ],
      ),
      body: Center(child: LottieBuilder.network(lottieColorLoading)),
    );
  }
}
