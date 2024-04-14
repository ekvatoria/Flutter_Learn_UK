import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            //color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text("Ali")),
            ),
          ),
          Card(
              color: Theme.of(context).colorScheme.error,
              child: const SizedBox(height: 100, width: 100)),
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 300,
              child: Center(child: Text("Ali")),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}

class _CustomCard extends StatelessWidget {
  _CustomCard({super.key, required this.child});
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: ProjectMargins.cardMargin,
        //color: Colors.white,
        shape: roundedRectangleBorder,
        child: child);
  }
}

// Borders
// StadiumBorder()
// CircleBorder()
// RoundedRectangleBorder()