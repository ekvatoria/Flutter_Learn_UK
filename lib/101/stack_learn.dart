import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              top: 100, bottom: 0, child: Container(color: Colors.purple)),
          Container(
            color: Colors.red,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(color: Colors.blue, height: 100),
          ),

          //
          Positioned(
              width: 25,
              top: 50,
              bottom: 0,
              child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
