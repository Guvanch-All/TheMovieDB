import 'package:flutter/cupertino.dart';
import 'package:the_movie_db/UI/widgets/main_news/news_widget_popular.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsWidgetPopular(),
      ],
    );
  }
}
