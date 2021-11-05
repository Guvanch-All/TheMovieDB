import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';

import '../../main.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.title,
    required this.time,
    required this.description,
    required this.imageName,
  });
}

class MoveListWidget extends StatefulWidget {

  MoveListWidget({Key? key}) : super(key: key);

  @override
  State<MoveListWidget> createState() => _MoveListWidgetState();
}

class _MoveListWidgetState extends State<MoveListWidget> {
  final _movies = [
    Movie(
      id:1,
        title: 'Space Jam: A New Legacy',
        time: '07/16/2021',
        description: 'When LeBron and his young son Dom are trapped in',
        imageName: AppImages.space),
    Movie(
      id:2,
      imageName: AppImages.space,
      title: 'Смертельная битва',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:3,
      imageName: AppImages.space,
      title: 'Прибытие',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:4,
      imageName: AppImages.space,
      title: 'Назад в будущее 1',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:5,
      imageName: AppImages.space,
      title: 'Назад в будущее 2',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:6,
      imageName: AppImages.space,
      title: 'Назад в будущее 3',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:7,
      imageName: AppImages.space,
      title: 'Первому игроку приготовится',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:8,
      imageName: AppImages.space,
      title: 'Пиксели',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:9,
      imageName: AppImages.space,
      title: 'Человек паук',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:10,
      imageName: AppImages.space,
      title: 'Лига справедливости',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:11,
      imageName: AppImages.space,
      title: 'Человек из стали',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:12,
      imageName: AppImages.space,
      title: 'Мстители',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:13,
      imageName: AppImages.space,
      title: 'Форд против феррари',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:14,
      imageName: AppImages.space,
      title: 'Джентельмены',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:15,
      imageName: AppImages.space,
      title: 'Тихие зори',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:16,
      imageName: AppImages.space,
      title: 'В бой идут одни старики',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id:17,
      imageName: AppImages.space,
      title: 'Дюна',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
  ];
  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovies(){
    final query = _searchController.text;
    if (query.isNotEmpty){
      _filteredMovies=_movies.where((Movie movie) {
       return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else{
      _filteredMovies =_movies;
    }
    setState(() { });
  }
  @override
  void initState() {
     super.initState();
     _filteredMovies =_movies;
     _searchController.addListener(_searchMovies);
  }
  void _onMovieTap(int index){
    final id =_movies[index].id;
    Navigator.of(context).pushNamed('/main_screen/movie_details',arguments: id);

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
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Поиск',
                labelStyle:const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                suffixIcon: const Icon(Icons.search,size: 25,),
                border: const OutlineInputBorder(),
              ),
            ))
      ],
    );
  }
}
