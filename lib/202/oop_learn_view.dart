import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/oop_learn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> with TickerProviderStateMixin {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SpinKitPouringHourGlass(
              color: Colors.white,
              size: 50.0,
              controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
