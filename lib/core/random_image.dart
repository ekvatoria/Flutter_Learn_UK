import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({super.key, this.height = 100});
  final imageUrl = 'https://picsum.photos/200/300';
  final double height;

  // constructor da this.height = 100 demek required yerine kullanılır.
  // Kullanıcı değeri göndermezse 100 al demektir.

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: 100, fit: BoxFit.cover);
  }
}
