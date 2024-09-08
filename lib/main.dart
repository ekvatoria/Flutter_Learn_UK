import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/app_bar.dart';
import 'package:flutter_full_learn/101/button_learn.dart';
import 'package:flutter_full_learn/101/card_learn.dart';
import 'package:flutter_full_learn/101/color_learn.dart';
import 'package:flutter_full_learn/101/column_row_learn.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';
import 'package:flutter_full_learn/101/custom_widget_learn.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/indicator_learn.dart';
import 'package:flutter_full_learn/101/list_tile_learn.dart';
import 'package:flutter_full_learn/101/list_view_builder.dart';
import 'package:flutter_full_learn/101/list_view_learn.dart';
//import 'package:flutter_full_learn/101/navigation_learn.dart';
import 'package:flutter_full_learn/101/padding_learn.dart';
import 'package:flutter_full_learn/101/page_view_learn.dart';
import 'package:flutter_full_learn/101/scaffold_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';
import 'package:flutter_full_learn/101/stateful_learn.dart';
import 'package:flutter_full_learn/101/stateful_life_cycle.dart';
import 'package:flutter_full_learn/101/stateless_learn.dart';
import 'package:flutter_full_learn/101/text_field_learn.dart';
import 'package:flutter_full_learn/101/text_learn.dart';
import 'package:flutter_full_learn/202/alert_learn.dart';
import 'package:flutter_full_learn/202/animated_learn_view.dart';
import 'package:flutter_full_learn/202/cache/secure_context/secure_context_learn.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn/202/cache/shared_list_cache.dart';
import 'package:flutter_full_learn/202/form_learn_view.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/202/model_learn_view.dart';
import 'package:flutter_full_learn/202/oop_learn_view.dart';
import 'package:flutter_full_learn/202/package_learn_view.dart';
import 'package:flutter_full_learn/202/service/comments_learn_view.dart';
import 'package:flutter_full_learn/202/service/service_learn_get_view.dart';
import 'package:flutter_full_learn/202/service/service_post_learn_view.dart';
import 'package:flutter_full_learn/202/sheet_learn.dart';
import 'package:flutter_full_learn/202/tab_learn.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';
import 'package:flutter_full_learn/202/theme_learn_view.dart';
import 'package:flutter_full_learn/303/call_back_learn.dart';
import 'package:flutter_full_learn/303/feed_view.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/mobx_image_picker/view/mobx_image_upload.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/303/part/part_of_learn.dart';
import 'package:flutter_full_learn/303/reqres_resource/view/reqres_view.dart';
import 'package:flutter_full_learn/303/tabbar_advance.dart';
import 'package:flutter_full_learn/demos/color_demos_view.dart';
import 'package:flutter_full_learn/demos/color_life_cycle_view.dart';
import 'package:flutter_full_learn/demos/my_collections_demo.dart';
import 'package:flutter_full_learn/demos/note_demos_view.dart';
import 'package:flutter_full_learn/demos/stack_demo_view.dart';
import 'package:flutter_full_learn/product/global/rescource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:flutter_full_learn/product/navigator/navigator_manager.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';
import 'package:flutter_full_learn/product/service/project_network_manager.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,

      // ThemeData.dark().copyWith(
      //   tabBarTheme: const TabBarTheme(
      //       labelColor: Colors.white, unselectedLabelColor: Colors.red, indicatorSize: TabBarIndicatorSize.label),
      //   bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),

      //   listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      //   inputDecorationTheme: const InputDecorationTheme(
      //       filled: true,
      //       fillColor: Colors.white,
      //       iconColor: Colors.red,
      //       border: OutlineInputBorder(),
      //       floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),

      //   // Card için proje geneli ön tanım, tüm projede geçerli olur.

      //   textTheme: const TextTheme(
      //       titleMedium: TextStyle(
      //           color: Colors
      //               .red)), //cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //   ),
      //   // colorScheme: const ColorScheme(
      //   //     onPrimary: Colors.blue,
      //   //     primary: Colors.blue,
      //   //     secondary: Colors.amber,
      //   //     onSecondary: Colors.amber,
      //   //     onError: Colors.amber,
      //   //     background: Colors.amber,
      //   //     onBackground: Colors.amber,
      //   //     surface: Colors.amber,
      //   //     onSurface: Colors.amber,
      //   //     error: Colors.red,
      //   //     brightness: Brightness.dark)
      // ),

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const LottieLearn();
          },
        );
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: const MobxImageUpload(),
    );
  }
}
