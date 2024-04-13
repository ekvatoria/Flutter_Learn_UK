import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Samples"),
      ),
      body: const Text("Merhaba"),
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) {
      //     return const Column();
      //   },
      // ),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: "a"),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: "b"),
        ]),
      ),
    );
  }
}
