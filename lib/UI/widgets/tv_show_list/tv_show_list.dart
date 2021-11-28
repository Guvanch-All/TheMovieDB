import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/navigation/main_navigation.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';

import '../../../main.dart';

class TVShow {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  TVShow({
    required this.id,
    required this.title,
    required this.time,
    required this.description,
    required this.imageName,
  });
}

class TVShowListWidget extends StatefulWidget {
  const TVShowListWidget({Key? key}) : super(key: key);

  @override
  _TVShowListWidgetState createState() => _TVShowListWidgetState();
}

class _TVShowListWidgetState extends State<TVShowListWidget> {
  final _movies = [
    TVShow(
        id: 1,
        title: 'Space Jam: A New Legacy',
        time: '07/16/2021',
        description: 'When LeBron and his young son Dom are trapped in',
        imageName: AppImages.space),
    TVShow(
      id: 2,
      imageName: AppImages.mortalKombat,
      title: 'Смертельная битва',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 3,
      imageName: AppImages.arival,
      title: 'Прибытие',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 4,
      imageName: AppImages.gobackfuture,
      title: 'Назад в будущее 1',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 5,
      imageName: AppImages.gobackfuture,
      title: 'Назад в будущее 2',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 6,
      imageName: AppImages.gobackfuture,
      title: 'Назад в будущее 3',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 7,
      imageName: AppImages.readyPlayerOne,
      title: 'Первому игроку приготовится',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 8,
      imageName: AppImages.pixels,
      title: 'Пиксели',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 9,
      imageName: AppImages.spiderMan,
      title: 'Человек паук',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 10,
      imageName: AppImages.deadPullBack,
      title: 'Лига справедливости',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 11,
      imageName: AppImages.mortalKombat,
      title: 'Человек из стали',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 12,
      imageName: AppImages.spiderMan,
      title: 'Мстители',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 13,
      imageName: AppImages.pixels,
      title: 'Форд против феррари',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 14,
      imageName: AppImages.space,
      title: 'Джентельмены',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 15,
      imageName: AppImages.readyPlayerOne,
      title: 'Тихие зори',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 16,
      imageName: AppImages.space,
      title: 'В бой идут одни старики',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 17,
      imageName: AppImages.space,
      title: 'Дюна',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
  ];
  var _filteredMovies = <TVShow>[];
  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((TVShow movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        //TODO: 2 раза повторяется BoxDecoration
                          color: lightTheme == true ? Colors.white : Colors.grey[850],
                          border:
                          Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color:lightTheme == true ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.3) ,
                                blurRadius: 8,
                                offset: const Offset(0, 2))
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 7),
                                Text(
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.grey),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        splashColor: Colors.blueAccent.withOpacity(0.3),
                        onTap: ()=>_onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              labelStyle: TextStyle(color: lightTheme == true ? Colors.black : Colors.white,),
              fillColor:lightTheme == true ? Colors.white.withAlpha(235) : Colors.black.withAlpha(200),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
