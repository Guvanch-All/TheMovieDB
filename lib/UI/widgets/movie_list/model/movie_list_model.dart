import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/UI/navigation/main_navigation.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/domain/entity/movies.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient(); //запросы сеть
  final _movies = <Movie>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;

  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;
  late String _locale = '';

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  void setupLocale(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    if(_isLoadingInProgress|| _currentPage >= _totalPage) return;
    _isLoadingInProgress =true;
    final nextPage = _currentPage + 1;
  try{
    final moviesResponse = await _apiClient.popularMovie(nextPage, _locale);
    _movies.addAll(moviesResponse.movies);
    _currentPage = moviesResponse.page;
    _totalPage = moviesResponse.totalPages;
    _isLoadingInProgress = false;
    notifyListeners();
  }catch(e){
    //TODO Уведемить пользователя об ошибке
    _isLoadingInProgress = false;
  }


  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  void showedMovieActIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadMovies();
  }
}
