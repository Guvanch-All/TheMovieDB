import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_movie_db/core/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/UI/widgets/movie_details/model/movie_details_model.dart';

import 'movie_details_main_cast_widget.dart';
import 'movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
        centerTitle: true,
      ),
      body:const _BodyWidget()
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if (model?.movieDetails?.title != null) {
      return Text(model!.movieDetails!.title);
    } else {
      return const SizedBox(
          child: SpinKitThreeBounce(
            color: Colors.grey,
            size: 20,
          ));
    }
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails= model?.movieDetails;
    if (movieDetails == null){
    return  const Center(
        child: SpinKitHourGlass(
          color: Colors.grey,
          size: 50,
        ),
      );
    }
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        MovieDetailsMainInfoWidget(),
        MovieDetailsZMainCastWidget(),
      ],
    );
  }
}
