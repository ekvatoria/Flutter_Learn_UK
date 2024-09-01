import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/303/feed_view.dart';

class TabAdvancelearn extends StatefulWidget {
  const TabAdvancelearn({super.key});

  @override
  State<TabAdvancelearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabAdvancelearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          //main üzerinden genel kullanımları bottomAppBarTheme vererek genel karakteristikler verilebilir.
          bottomNavigationBar: BottomAppBar(
            height: 45,
            notchMargin: _notchedValue,
            shape: const CircularNotchedRectangle(),
            //main üzerinden genel kullanımları tabBarTheme vererek genel karakteristikler verilebilir.
            child: _myTabView(),
          ),
          appBar: AppBar(
              // bottom: TabBar(controller: _tabController, tabs: const [
              //   Text('RED'),
              //   Text('GREEN'),
              // ]),
              ),
          body: _tabbarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.white,
        // isScrollable: true,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.green,
        padding: EdgeInsets.zero,
        onTap: (value) {},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList()

        //   tabs: const [
        //   Text('RED'),
        //   Text('GREEN'),
        // ]
        );
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [const FeedView(), IconLearnView(), IconLearnView(), IconLearnView()]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
