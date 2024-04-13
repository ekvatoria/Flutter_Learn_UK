import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text("a" * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("b" * 50),
          ),
          Container(
            //width: 50,
            //height: 50,
            constraints: const BoxConstraints(
                maxWidth: 200, minWidth: 100, maxHeight: 120, minHeight: 10),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text(
              "aa" * 100,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}

// 1.kullanım
class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
      boxShadow: const [BoxShadow(color: Colors.green, offset: Offset(0.1, 1))],
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      border: Border.all(width: 10, color: Colors.white12));
}

// 2.kullanım
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
            boxShadow: const [
              BoxShadow(color: Colors.green, offset: Offset(0.1, 1))
            ],
            gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
            border: Border.all(width: 10, color: Colors.white12));
}
