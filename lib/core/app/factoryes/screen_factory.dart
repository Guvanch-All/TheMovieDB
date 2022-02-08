import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/UI/widgets/main_news/news_widget.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/manager/movie_list_model.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/page/move_list_widget.dart';
import 'package:the_movie_db/UI/widgets/tv_show_list/tv_show_list.dart';
import 'package:the_movie_db/auth_screen/UI/manager/auth_model.dart';
import 'package:the_movie_db/core/Library/Widget/Inherited/provider.dart'
    as old_provider;
import 'package:the_movie_db/UI/widgets/movie_details/model/movie_details_model.dart';
import 'package:the_movie_db/UI/widgets/movie_details/movie_details_widget.dart';
import 'package:the_movie_db/UI/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:the_movie_db/feature/auth_screen/UI/manager/auth_model.dart';
import 'package:the_movie_db/feature/auth_screen/UI/page/auth_widget.dart';
import 'package:the_movie_db/feature/loader_screen/UI/loader_page.dart';
import 'package:the_movie_db/feature/loader_screen/viewModel/loader_view_model.dart';
import 'package:the_movie_db/feature/main_screen/main_screen_widget.dart';

//создает экраны
class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      child: const LoaderWidget(),
      lazy: false,
    );
  }

  Widget makeAuthWidget() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreenWidget() {
    return  const MainScreenWidget();
  }

  Widget makeMovieDetailsWidget(int movieId) {
    return old_provider.NotifierProvider(
      create: () => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailerWidget(String youTubeKey) {
    return MovieTrailerWidget(youTubeKey: youTubeKey);
  }

  Widget makeNewsList(){
    return const NewsWidget();
  }

  Widget makeMovieList(){
    return ChangeNotifierProvider(
      create: (_) => MovieListViewModel(),
      child: const MoveListWidget(),
    );
  }
  Widget makeTVShowList(){
    return const TVShowListWidget();
  }

}
