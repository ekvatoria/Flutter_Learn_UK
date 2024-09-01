import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onNumber});
  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  // bana bir sayi don random. Kontrol edip sana bir cevap verecegim.
  // bu cevaba gore butonun rengini guncelle
  // eger sayi dogru ise yesil yanlis ise kirmizi yap
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
        onPressed: () {
          final result = Random().nextInt(10);

          final response = widget.onNumber?.call(result) ?? false;
          setState(() {
            _backgroundColor = response ? Colors.green : Colors.red;
          });
        },
        child: const Text('data'));
  }
}
