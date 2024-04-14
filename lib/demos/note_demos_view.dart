import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final _title = 'Create your first note';
  final _description = 'Add a note';
  final _createNote = 'Create a Note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PagePaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            const SizedBox(height: BoxHeight.boxHeight20),
            _TitleWidget(title: _title),
            Padding(
              padding: PagePaddingItems.verticalPadding,
              child: _SubtitleWidget(title: _description * 10),
            ),
            const Spacer(),
            _createButton(context),
            TextButton(
                onPressed: () {},
                child: Text(_importNotes,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.blue,
                        ))),
            const SizedBox(height: BoxHeight.boxHeight50)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            height: ButtonHeights.buttonNormalHeight,
            child: Center(
                child: Text(
              _createNote,
              style: Theme.of(context).textTheme.headlineSmall,
            ))));
  }
}

// Centered text widget
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    super.key,
    this.textAlign = TextAlign.center,
    required this.title,
  });
  final TextAlign? textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}

class PagePaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}

class BoxHeight {
  static const double boxHeight50 = 50;
  static const double boxHeight20 = 20;
}
