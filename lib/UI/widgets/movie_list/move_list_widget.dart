import 'package:flutter/material.dart';
import 'package:the_movie_db/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import '../../../main.dart';
import 'model/movie_list_model.dart';

class MoveListWidget extends StatelessWidget {
  const MoveListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.movies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            model.showedMovieActIndex(index);
            final movie = model.movies[index];
            final posterPath = movie.posterPath;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        //TODO: 2 раза повторяется BoxDecoration
                        color: lightTheme == true
                            ? Colors.white
                            : Colors.grey[850],
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: lightTheme == true
                                  ? Colors.black.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2))
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        posterPath != null
                            ? Image.network(
                                ApiClient.imageUrl(posterPath),
                                width: 95,
                              )
                            : const SizedBox.shrink(),
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
                                model.stringFromDate(movie.releaseDate),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.grey),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                movie.overview ?? '...',
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      splashColor: Colors.blueAccent.withOpacity(0.3),
                      onTap: () => model.onMovieTap(context, index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Поиск',
                labelStyle: TextStyle(
                  color: lightTheme == true ? Colors.black : Colors.white,
                ),
                filled: true,
                fillColor: lightTheme == true
                    ? Colors.white.withAlpha(235)
                    : Colors.black.withAlpha(200),
                suffixIcon: const Icon(
                  Icons.search,
                  size: 25,
                ),
                border: const OutlineInputBorder(),
              ),
            ))
      ],
    );
  }
}
