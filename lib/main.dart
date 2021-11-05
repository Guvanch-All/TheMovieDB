import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/auth/auth_widget.dart';
import 'package:the_movie_db/UI/movie/movie_details/movie_details_widget.dart';
import 'package:the_movie_db/utils/theme.dart';

import 'UI/main_screen/main_screen_widget.dart';
import 'draw_progress.dart';

bool lightTheme = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movie DB',
      theme: lightTheme == true ? basicTheme() : basicDarkTheme(),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}
