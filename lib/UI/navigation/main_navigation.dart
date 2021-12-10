import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/UI/widgets/auth/auth_widget.dart';
import 'package:the_movie_db/UI/widgets/auth/model/auth_model.dart';
import 'package:the_movie_db/UI/widgets/main_screen/main_screen_widget.dart';
import 'package:the_movie_db/UI/widgets/main_screen/model/main_screen_model.dart';
import 'package:the_movie_db/UI/widgets/movie_details/model/movie_details_model.dart';
import 'package:the_movie_db/UI/widgets/movie_details/movie_details_widget.dart';
import 'package:the_movie_db/UI/widgets/movie_trailer/movie_trailer_widget.dart';

class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movieDetails';
  static const movieTrailerWidget = '/movieDetails/trailer';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => NotifierProvider(
          create: () => AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => NotifierProvider(
          create: () =>  MainScreenModel(),
          child: const MainScreenWidget(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (context) => NotifierProvider(
                  create: () =>  MovieDetailsModel(movieId),
                  child: const MovieDetailsWidget(),
                ));
      case MainNavigationRouteNames.movieTrailerWidget:
        final arguments = settings.arguments;
        final youTubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
            builder: (context) =>  MovieTrailerWidget(youTubeKey: youTubeKey,)
            );


      default:
        const widget = Text('Navigation error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
