import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
                //backgroundColor: Colors.red,
                //barrierColor: Colors.transparent,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                // isScrollControlled: true,
                context: context,
                builder: (context) {
                  return _CustomSheet(backgroundColor: _backgroundColor);
                });
            // inspect(result);
            if (result is bool) {
              setState(() {
                _backgroundColor = Colors.cyan;
              });
            }
          },
          child: const Icon(Icons.share)),
      body: Center(
        child: TextButton(
            onPressed: () {
              showCustomSheet(context, const ImageLearn202());
            },
            child: const Text('Show')),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
    required Color backgroundColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  // ignore: prefer_final_fields
  Color _backgroundColor = Colors.white;
  final _gripHeight = 24.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: _backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: _gripHeight,
                  child: Stack(
                    children: [
                      Divider(
                          color: Colors.black26,
                          thickness: 3,
                          indent: MediaQuery.of(context).size.width * 0.45,
                          endIndent: MediaQuery.of(context).size.width * 0.45),
                      Positioned(
                          top: 5,
                          right: 0,
                          height: 24,
                          child: IconButton(
                              padding: EdgeInsetsDirectional.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close)))
                    ],
                  ),
                ),
                const Text('data22'),
                Image.network('https://picsum.photos/200', height: 200),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _backgroundColor = Colors.amber;
                        Navigator.of(context).pop<bool>(true);
                      });
                    },
                    child: const Text('OK'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        //backgroundColor: Colors.red,
        //barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          // return _CustomSheet(backgroundColor: _backgroundColor);
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({super.key, required this.child});
  final Widget child;
  final _gripHeight = 24.0;

  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: _CustomSheetState()._backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _BaseSheetHeader(gripHeight: _gripHeight),
                Expanded(child: child),
                const Text('data22'),
                Image.network('https://picsum.photos/200', height: 200),
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         _backgroundColor = Colors.amber;
                //         Navigator.of(context).pop<bool>(true);
                //       });
                //     },
                //     child: const Text('OK'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    super.key,
    required double gripHeight,
  }) : _gripHeight = gripHeight;

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
              color: Colors.black26,
              thickness: 3,
              indent: MediaQuery.of(context).size.width * 0.45,
              endIndent: MediaQuery.of(context).size.width * 0.45),
          Positioned(
              top: 5,
              right: 0,
              height: 24,
              child: IconButton(
                  padding: EdgeInsetsDirectional.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)))
        ],
      ),
    );
  }
}
