import 'package:flutter/cupertino.dart';
import 'package:the_movie_db/UI/widgets/main_news/news_widget_free_to_watch.dart';
import 'package:the_movie_db/UI/widgets/main_news/news_widget_popular.dart';

import 'news_widget_leader_boards.dart';
import 'news_widget_trailer.dart';
import 'news_widget_trandings.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsWidgetPopular(),
        NewsWidgetFreeToWatch(),
        NewsWidgetTrailer(),
        NewsWidgetTrandings(),
        NewsWidgetLeaderboards()
      ],
    );
  }
}
