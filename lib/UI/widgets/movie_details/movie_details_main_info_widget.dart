import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/core/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/core/app/navigation/main_navigation.dart';
import 'package:the_movie_db/core/api/image_downloader.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/domain/entity/movie_details_credits.dart';
import 'package:the_movie_db/core/utils/widget_draw/draw_progress.dart';
import 'package:the_movie_db/core/utils/style_constants.dart';
import 'model/movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopPosters(),
        Padding(padding: EdgeInsets.all(15), child: _MovieNameWidget()),
        Divider(),
        _ScoreWidget(),
        _SummeryWidget(),
        _OverView(),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: _MainRole(),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class TopPosters extends StatelessWidget {
  const TopPosters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final backdropPath = model?.movieDetails?.backdropPath;
    final posterPath = model?.movieDetails?.posterPath;

    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ImageDownloader.imageUrl(backdropPath))
              : const SizedBox.shrink(),
          Positioned(
              top: 20,
              left: 20,
              bottom: 20,
              child: posterPath != null
                  ? Image.network(ImageDownloader.imageUrl(posterPath))
                  : const SizedBox.shrink()),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                model?.isFavorite == true
                    ? Icons.favorite
                    : Icons.favorite_outline,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var year = model?.movieDetails?.releaseDate?.year.toString();
    year = year != null ? ' {$year}' : '';
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.left,
      text: TextSpan(children: [
        TextSpan(
            text: model?.movieDetails?.title,
            style: Theme.of(context).textTheme.bodyText2),
        TextSpan(
            text: year,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: ltPrimaryGreyColor)),
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    var voteAverage = movieDetails?.voteAverage ?? 0;
    final videos = movieDetails?.videos.results.where(
        (videos) => videos.type == 'Trailer' && videos.site == "YouTube");
    final trailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;
    voteAverage = voteAverage * 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: RadialPercentWidget(
                  child: Text(voteAverage.toStringAsFixed(0),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  percent: voteAverage / 100,
                  fillColor: const Color(0xFF202126),
                  lineColor: const Color(0xFF9FBF46),
                  freeColor: const Color(0xFFF5E28B),
                  lineWidth: 0.011,
                ),
              ),
              const SizedBox(width: 10),
              const Text('User score'),
            ],
          ),
        ),
        Container(width: 1, height: 15, color: Colors.grey),
        trailerKey != null
            ? TextButton(
                //TODO навигацию Вынести в модель
                onPressed: () => Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.movieTrailerWidget,
                    arguments: trailerKey),
                child: Row(
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      size: 30,
                    ),
                    Text('Play Trailer'),
                  ],
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    final releaseDate = model.movieDetails?.releaseDate;
    if (releaseDate != null) {
      texts.add(model.stringFromDate(releaseDate));
    }
    final productionCountries = model.movieDetails?.productionCountries;
    if (productionCountries != null && productionCountries.isNotEmpty) {
      texts.add('(${productionCountries.first.iso})');
    }
    final runtime = model.movieDetails?.runtime ?? 0;
    final duration = Duration(minutes: runtime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    texts.add('${hours}h ${minutes}m');

    final genres = model.movieDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }

    // 'R, 08/04/2020 (US) • Animation, '
    //     'Action, Adventure, Science Fiction • 1h 27m'
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      child: Text(
        texts.join(' '),
        style: Theme.of(context).textTheme.bodyText1,
        maxLines: 3,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 10),
          Text(
            model?.movieDetails?.overview ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

class _MainRole extends StatelessWidget {
  const _MainRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var crew = model?.movieDetails?.credits.crew;
    if (crew == null || crew.isEmpty) return const SizedBox.shrink();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<Employee>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }
    return Column(
        children: crewChunks
            .map((chunk) => Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 5),
                  child: _MainRoleRow(employes: chunk),
                ))
            .toList());
  }
}

class _MainRoleRow extends StatelessWidget {
  final List<Employee> employes;

  const _MainRoleRow({Key? key, required this.employes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: employes
          .map(
            (employee) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: _PeopleWidgetRowItem(
                  employee: employee,
                ),
              ),
            ),
          )
          .toList(),

      // [
    );
  }
}

class _PeopleWidgetRowItem extends StatelessWidget {
  final Employee employee;

  const _PeopleWidgetRowItem({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(employee.name, style: Theme.of(context).textTheme.bodyText2),
          Text(employee.job,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
