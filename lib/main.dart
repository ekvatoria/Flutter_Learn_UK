import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/app_bar.dart';
import 'package:flutter_full_learn/101/button_learn.dart';
import 'package:flutter_full_learn/101/color_learn.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/scaffold_learn.dart';
import 'package:flutter_full_learn/101/text_learn.dart';

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
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          colorScheme: const ColorScheme(
              onPrimary: Colors.amber,
              primary: Colors.amber,
              secondary: Colors.amber,
              onSecondary: Colors.amber,
              onError: Colors.amber,
              background: Colors.amber,
              onBackground: Colors.amber,
              surface: Colors.amber,
              onSurface: Colors.amber,
              error: Colors.amber,
              brightness: Brightness.dark)),
      home: const ColorLearnView(),
    );
  }
}
