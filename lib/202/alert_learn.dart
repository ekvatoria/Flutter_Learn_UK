import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // showAboutDialog(context: context, applicationName: 'UK', children: [const Text('data')]);
        final response = showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (context) {
              // return UpdateDialog(context: context);
              return const _ImageZoomDialog();
            });
        inspect(response);
      }),
      body: Container(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog();
  }
}

class Keys {
  static const versionUpdate = 'Version update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
      : super(
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Update2')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          'https://picsum.photos/200',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
