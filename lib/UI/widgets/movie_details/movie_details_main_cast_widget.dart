import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';
import '../../../../main.dart';
import 'model/movie_details_model.dart';


class MovieDetailsZMainCastWidget extends StatelessWidget {
  const MovieDetailsZMainCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Series Cast',
                style: lightTheme == true ? Theme.of(context).textTheme.bodyText2:
                Theme.of(context).textTheme.bodyText2!.copyWith(color: ltPrimaryTextColor ,fontSize: 20),
              )),
          const SizedBox(
            height: 250,
            child: Scrollbar(
              child: _ActorListWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: TextButton(
              onPressed: () {},
              child: Text('Full Cast & Crew'),
            ),
          )
        ],
      ),
    );
  }
}

class _ActorListWidget extends StatelessWidget {
  const _ActorListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model=NotifierProvider.watch<MovieDetailsModel>(context);
    final actor = model?.movieDetails!.credits.cast;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: actor?.length,
        itemExtent: 120,
        itemBuilder: (BuildContext context, int index) {
          return  _ActorListItemWidget(actorIndex: index);
        });
  }
}

class _ActorListItemWidget extends StatelessWidget {
  final int actorIndex;
  const _ActorListItemWidget({
    Key? key,
    required this.actorIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model=NotifierProvider.watch<MovieDetailsModel>(context);
    final actor = model?.movieDetails!.credits.cast[actorIndex];
    final backdropPath=actor?.profilePath;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
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
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(
            Radius.circular(8)

          ),
          child: Expanded(
            child: Column(
              children:   [
                backdropPath != null
                    ? Image.network(
                  ApiClient.imageUrl(backdropPath),
                  width: 110,
                  height: 110,
                  fit: BoxFit.fitWidth,
                ) : const SizedBox.shrink(),
              Padding(padding: const EdgeInsets.all(8.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    actor!.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    actor.character,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                  ),
                ],
              ))
              ],
            ),
          ),
        ),
      )
    );
  }
}
