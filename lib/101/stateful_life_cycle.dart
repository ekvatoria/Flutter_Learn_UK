import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  ///--1--///
  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  ///--2--///
  // uygulamada sayfadan çıkıldığı zaman temizler
  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

  ///--3--///
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('c');
  }

  // Mesaj tekse yanına tek yoksa çift yaz

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isOdd) {
      _message += "Tek";
    } else {
      _message += "Çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
