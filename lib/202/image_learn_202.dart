import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/rescource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: const Icon(Icons.remove))
        ],
      ),
      body: ImagePaths.ic_apple_with_school.toWidget(height: 100),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  ic_apple_with_school
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
