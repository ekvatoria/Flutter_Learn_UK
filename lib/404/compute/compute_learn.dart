import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/product/init/lang/locale_keys.g.dart';
import 'package:flutter_full_learn/product/init/product_init.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({super.key});

  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_result.toString()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // int result = 0;
        // for (var i = 0; i < 100000000; i++) {
        //   result = i * i;
        // }
        final result = await compute(Calculator.sum, 10000000);
        setState(() {
          // _result = result;
          _result = result;
        });
      }),
      body: Column(
        children: [const CircularProgressIndicator(), Text(LocaleKeys.login_welcome.tr()), const LottieLearn()],
      ),
    );
  }
}

class Calculator {
  static int sum(int limit) {
    int result = 0;
    for (var i = 0; i < limit; i++) {
      result = i * i;
    }
    return result;
  }
}
