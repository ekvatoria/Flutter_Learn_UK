import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initalize();
  }

  Future<void> _initalize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    //int e cast edeceksek String i
    // ignore: no_leading_underscores_for_local_identifiers
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor))
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setInt('counter', _currentValue);

          changeLoading();
          await _manager.saveString(SharedKeys.counter, _currentValue.toString());
          changeLoading();
        });
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
        child: const Icon(Icons.remove),
        onPressed: () async {
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.remove('counter');
          changeLoading();
          _manager.removeItem(SharedKeys.counter);
          changeLoading();
        });
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('uk', '10', 'ugurkilic.com'),
      User('uk2', '102', 'ugurkilic.com'),
      User('uk3', '103', 'ugurkilic.com')
    ];
  }
}

// Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
