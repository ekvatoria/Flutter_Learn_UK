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
import 'package:flutter_full_learn/101/padding_learn.dart';
import 'package:flutter_full_learn/101/scaffold_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';
import 'package:flutter_full_learn/101/stateless_learn.dart';
import 'package:flutter_full_learn/101/text_learn.dart';
import 'package:flutter_full_learn/demos/note_demos_view.dart';
import 'package:flutter_full_learn/demos/stack_demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white),

        // Card için proje geneli ön tanım, tüm projede geçerli olur.
        //cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // colorScheme: const ColorScheme(
        //     onPrimary: Colors.blue,
        //     primary: Colors.blue,
        //     secondary: Colors.amber,
        //     onSecondary: Colors.amber,
        //     onError: Colors.amber,
        //     background: Colors.amber,
        //     onBackground: Colors.amber,
        //     surface: Colors.amber,
        //     onSurface: Colors.amber,
        //     error: Colors.red,
        //     brightness: Brightness.dark)
      ),
      home: const StackDemoView(),
    );
  }
}
