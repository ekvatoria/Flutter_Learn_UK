import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_learn_cache.dart';

class SnippetLearn extends StatefulWidget {
  const SnippetLearn({super.key});

  @override
  State<SnippetLearn> createState() => _SnippetLearnState();
}

class _SnippetLearnState extends LoadingStatefull<SnippetLearn> {
  @override
  bool isLoading = false;
  @override
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
