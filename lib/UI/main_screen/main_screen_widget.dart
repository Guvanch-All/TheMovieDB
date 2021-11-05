import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/movie/move_list_widget.dart';
import 'package:the_movie_db/utils/style_constants.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[];
    final items = [
      const Icon(Icons.home, size: 30, color: Colors.white),
      const Icon(Icons.tv, size: 30, color: Colors.white),
      const Icon(Icons.movie_filter, size: 30, color: Colors.white),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Movie DB'),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedTab,
        animationCurve: Curves.easeOutExpo,
        backgroundColor: Colors.transparent,
        color: ltAppBarColor,
        items: items,
        height: 60,
        onTap: (index) => setState(() => _selectedTab = index),
      ),
      body: IndexedStack(index: _selectedTab, children: [
        const Text('data сериалы'),
        MoveListWidget(),
        const Text('data сериалы'),
      ]),
    );
  }
}
