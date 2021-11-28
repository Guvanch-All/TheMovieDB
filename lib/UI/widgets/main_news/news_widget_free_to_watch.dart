import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/widget_draw/draw_progress.dart';

class NewsWidgetFreeToWatch extends StatefulWidget {
  const NewsWidgetFreeToWatch({Key? key}) : super(key: key);

  @override
  _NewsWidgetFreeToWatchState createState() => _NewsWidgetFreeToWatchState();
}

class _NewsWidgetFreeToWatchState extends State<NewsWidgetFreeToWatch> {
  final _category = 'movies';

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
              Text(
                'Free To Watch',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              DropdownButton<String>(
                value: _category,
                onChanged: (category) {},
                items: const [
                  DropdownMenuItem(value: 'movies', child: Text('Movies')),
                  DropdownMenuItem(value: 'tv', child: Text('TV')),
                ],
              )
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
                padding: const EdgeInsets.all(10.0),
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
                              image: AssetImage(AppImages.deadPullBack),
                            ),
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
                        const Positioned(
                          left: 10,
                          bottom: 0,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: RadialPercentWidget(
                              percent: 0.75,
                              fillColor: Color(0xFF202126),
                              lineColor: Color(0xFF9FBF46),
                              freeColor: Color(0xFFF5E28B),
                              lineWidth: 1,
                              child: Text(
                                '75%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Text(
                        'Death Stroke',
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
                        'March 15, 2021',
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
