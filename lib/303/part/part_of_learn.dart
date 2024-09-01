import 'package:flutter/material.dart';
part 'part_appbar.dart';

class PartofLearn extends StatefulWidget {
  const PartofLearn({super.key});

  @override
  State<PartofLearn> createState() => _PartofLearnState();
}

class _PartofLearnState extends State<PartofLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _PartofAppBar(),
      body: Container(),
    );
  }
}


//TODO:V15T1100