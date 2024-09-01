import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //ListView.separated (separated ta ve sizedbox ile alt widget expanded = performans && pagination)
      //ve ListView.builder
      body: ListView.separated(
          itemBuilder: (context, index) {
            print(index);
            return SizedBox(
              height: 200,
              child: Column(
                children: [Expanded(child: Image.network('https://picsum.photos/200')), Text('$index')],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: Colors.white, height: 26);
          },
          itemCount: 15),

      // ListView.builder(itemBuilder: (context, index) {
      //   return Column(
      //     children: [const Placeholder(color: Colors.red), Text('$index')],
      //   );
      // }),
    );
  }
}
