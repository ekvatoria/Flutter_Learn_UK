import 'package:flutter/material.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});
  final String _title = 'Wellcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mark_email_read_sharp)),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
