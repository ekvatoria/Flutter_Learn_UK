import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const RandomImage(),
                dense: true,
                //contentPadding: EdgeInsets.zero,
                onTap: () {},
                subtitle: const Text('How do you use your card'),
                minVerticalPadding: 0,
                leading: Container(
                    width: 30,
                    alignment: Alignment.center,
                    height: 200,
                    color: Colors.red,
                    child: const Icon(Icons.money)),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          )
        ],
      ),
    );
  }
}
