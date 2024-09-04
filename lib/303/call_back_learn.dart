import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallBackUser user) {
            print(user);
          }),
          AnswerButton(onNumber: (number) {
            return number % 3 == 1;
          }),
          LoadingButton(
            title: 'Save',
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  CallBackUser(this.name, this.id);

  final int id;
  final String name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;

// TODO Dummy Remove It
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('uk', 123),
      //CallBackUser('uk2', 124),
    ];
  }
}
