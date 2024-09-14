import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/animated_learn_view.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Kartal', style: context.textTheme().bodyLarge),
        ],
      ),
    );
  }
}
