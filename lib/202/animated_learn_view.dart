import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  //Text('data', style: context.textTheme().displayLarge),
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _placeHolderWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeVisible();
            controller.animateTo(_isVisible ? 1 : 0);
          },
        ),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems.durationLow, opacity: _isOpacity ? 1 : 0, child: const Text('data')),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.precision_manufacturing_rounded)),
            ),
            AnimatedDefaultTextStyle(
                style: (_isVisible ? context.textTheme().displayLarge : context.textTheme().titleMedium) ??
                    const TextStyle(),
                duration: _DurationItems.durationLow,
                child: const Text('data')),
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
            AnimatedContainer(
                duration: _DurationItems.durationLow,
                height: _isVisible ? kZero : MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                color: Colors.blue,
                margin: const EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'Hoppa',
                  style: TextStyle(color: Colors.deepOrangeAccent.shade700, fontSize: 30),
                ))),
            const Expanded(
                child: Stack(
              children: [
                AnimatedPositioned(
                    top: 30, curve: Curves.elasticInOut, duration: _DurationItems.durationLow, child: Text('data')),
              ],
            )),
            Expanded(
              child: AnimatedList(
                itemBuilder: (context, index, animation) {
                  return const Text('data2');
                },
              ),
            )
          ],
        ));
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
