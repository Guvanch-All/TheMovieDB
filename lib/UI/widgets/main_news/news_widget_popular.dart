import 'package:flutter/material.dart';
import 'package:the_movie_db/core/resources/resources.dart';
import 'package:the_movie_db/core/utils/widget_draw/draw_progress.dart';

class NewsWidgetPopular extends StatefulWidget {
  const NewsWidgetPopular({Key? key}) : super(key: key);

  @override
  _NewsWidgetPopularState createState() => _NewsWidgetPopularState();
}

class _NewsWidgetPopularState extends State<NewsWidgetPopular> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Whats`s popular',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                items: const [
                  DropdownMenuItem(value: 'movies', child: Text('Movies')),
                  DropdownMenuItem(value: 'tv', child: Text('TV')),
                  DropdownMenuItem(value: 'tvShows', child: Text('TVShows')),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 306,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: const Image(
                                image: AssetImage(AppImages.mortalKombat)),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.more_horiz),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: RadialPercentWidget(
                              percent: 0.67,
                              fillColor: const Color(0xFF202126),
                              lineColor: const Color(0xFF9FBF46),
                              freeColor: const Color(0xFFF5E28B),
                              lineWidth: 1,
                              child: Text('68%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 8.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text(
                        'Mortal Kombat',
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, right: 10),
                      child: Text(
                        'Feb 12, 2021',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
