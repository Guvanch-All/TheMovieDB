import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/UI/widgets/main_news/news_widget.dart';
import 'package:the_movie_db/UI/widgets/movie_list/model/movie_list_model.dart';
import 'package:the_movie_db/UI/widgets/tv_show_list/tv_show_list.dart';
import 'package:the_movie_db/UI/widgets/movie_list/move_list_widget.dart';
import 'package:the_movie_db/utils/style_constants.dart';

import '../../../main.dart';

final _movieListModel = MovieListModel();

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieListModel.setupLocale(context);
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
          centerTitle: true,
          title:
              _selectedTab == 1 ? SearchBarWidget() : const Text('My Movie DB')
          // IconButton(
          //     onPressed: ()=> SessionDataProvider().setSessionId(null),
          //     icon: const Icon(Icons.logout)),
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
        const NewsWidget(),
        NotifierProvider(
          create: () => _movieListModel,
          isManageModel: false,
          child: const MoveListWidget(),
        ),
        const TVShowListWidget()
      ]),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          style: const TextStyle(color: Colors.white),
          onChanged: _movieListModel.searchMovie,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 18,
              color: Colors.white,
            ),
            labelStyle: TextStyle(
              color: lightTheme == true ? Colors.black : Colors.white,
            ),
            isDense: true,
            hintText: 'Поиск филма',
            hintStyle: const TextStyle(color: Colors.grey, height: 0.7),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 40),
            enabledBorder: _buildBorder(Colors.white),
            focusedBorder: _buildBorder(Colors.blueAccent),
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
        ),
      ],
    );
  }
}

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ));
}
