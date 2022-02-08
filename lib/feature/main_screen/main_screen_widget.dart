import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/manager/movie_list_model.dart';
import 'package:the_movie_db/core/app/factoryes/screen_factory.dart';
import 'package:the_movie_db/core/utils/style_constants.dart';

import '../../../main.dart';

final _movieListModel = MovieListViewModel();

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  final _screenFactory = ScreenFactory();

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30, color: Colors.white),
      const Icon(Icons.tv, size: 30, color: Colors.white),
      const Icon(Icons.movie_filter, size: 30, color: Colors.white),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Movie DB'),

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
        _screenFactory.makeNewsList(),
        _screenFactory.makeMovieList(),
        _screenFactory.makeTVShowList(),
      ]),
    );
  }
}


