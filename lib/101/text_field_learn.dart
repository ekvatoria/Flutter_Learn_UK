import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            //inputFormatters: [TextProjectInputFormatter()._formatter],
            textInputAction: TextInputAction.next,

            focusNode: focusNodeTextFieldOne,
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) =>
                _animatedContainer(currentLength),
            decoration: _InputDecorator().emailInput,
          ),
          TextField(
            focusNode: focusNodeTextFieldTwo,
            minLines: 2,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1), color: Colors.green, width: 10.0 * (currentLength ?? 0), height: 10);
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == 'a') {
      return oldValue;
    }
    return oldValue;
  });
}

class _InputDecorator {
  final emailInput = const InputDecoration(
      prefixIcon: Icon(
        Icons.mail,
        color: Colors.teal,
      ),
      border: OutlineInputBorder(),
      labelText: LanguageItems.mailTitle,
      labelStyle: TextStyle(color: Colors.teal));
}
