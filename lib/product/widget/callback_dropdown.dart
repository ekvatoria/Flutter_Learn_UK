import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/call_back_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({super.key, required this.onUserSelected});
  //immutable, değişmeyen state te final vererek müşterinin bu callback metodunu yollaması istenir.
  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropdown> createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      //üst tanımdan geçtiyse ! ile force edilebilir.
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
              value: _user,
              child: Text(
                e.name,
                style: Theme.of(context).textTheme.displaySmall,
              ));
        }).toList(),
        onChanged: _updateUser);
  }
}
