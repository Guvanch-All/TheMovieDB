import 'package:flutter/material.dart';

import '../../../main.dart';
import 'movie_details_main_cast_widget.dart';
import 'movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
    MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deathstroke: Knights & Dragons '),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MovieDetailsMainInfoWidget(),
          MovieDetailsZMainCastWidget(),
        ],
      ),
    );
  }
}
