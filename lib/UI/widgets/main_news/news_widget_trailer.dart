import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';

class NewsWidgetTrailer extends StatefulWidget {
  const NewsWidgetTrailer({Key? key}) : super(key: key);

  @override
  _NewsWidgetTrailerState createState() => _NewsWidgetTrailerState();
}

class _NewsWidgetTrailerState extends State<NewsWidgetTrailer> {
  final _category = "streaming";

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          colorFilter:
              ColorFilter.mode(Colors.blueGrey.shade700, BlendMode.modulate),
          image: const AssetImage(AppImages.trailerBackground),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lastes Trailer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 20, color: ltPrimaryWhiteColor),
                ),
                DropdownButton<String>(
                  value: _category,
                  dropdownColor: Colors.blueGrey.shade900,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (category) {},
                  items: [
                    DropdownMenuItem(
                        value: 'streaming',
                        child: Text(
                          'Streaming',
                          style: TextStyle(color: ltPrimaryWhiteColor),
                        )),
                    DropdownMenuItem(
                        value: 'tv',
                        child: Text(
                          'on TV',
                          style: TextStyle(color: ltPrimaryWhiteColor),
                        )),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 306,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemExtent: constraints.maxWidth * 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      Image(
                                        image: AssetImage(AppImages.trailerPreview),
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -20,
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(Icons.more_horiz),
                                ),
                              ),
                            ],
                          ),
                          Text('Elite',
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: ltPrimaryWhiteColor)),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Elite Season 4 | Trailter | Netflix',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: ltPrimaryWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
