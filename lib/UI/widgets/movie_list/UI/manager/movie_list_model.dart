import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/domain/api_client/movie_api_client.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/domain/service/movie_service.dart';
import 'package:the_movie_db/core/Library/paginator.dart';
import 'package:the_movie_db/core/app/navigation/main_navigation.dart';
import 'package:the_movie_db/domain/entity/movies.dart';

class MovieListRowData {
  final int id;
  final String? posterPath;
  final String title;
  final String releaseDate;
  final String overview;

  MovieListRowData({
    required this.posterPath,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
  });

// MovieListRowData.fromMovie(Movie movie){
//
// }
}

class MovieListViewModel extends ChangeNotifier {
  final _apiClient = MovieApiClient(); //запросы сеть
  final _movieService = MovieService(); //Сервис
  late final Paginator<Movie> _popularMoviePaginator;
  late final Paginator<Movie> _searchMoviePaginator;
  late String _locale = '';
  Timer? searchDebounce;

  var _movies = <MovieListRowData>[];
  String? _searchQuery;

  bool get isSearchMode {
    final searchQuery = _searchQuery;
    return searchQuery != null && searchQuery.isNotEmpty;
  }

  List<MovieListRowData> get movies => List.unmodifiable(_movies);
  late DateFormat _dateFormat;

  MovieListViewModel() {
    _popularMoviePaginator = Paginator<Movie>((page) async {
      final result = await _movieService.popularMovie(page, _locale);
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.totalPages);
    });
    _searchMoviePaginator = Paginator<Movie>((page) async {
      final result = await _movieService.searchMovie(
        page,
        _locale,
        _searchQuery ?? '',
      );
      return PaginatorLoadResult(
          data: result.movies,
          currentPage: result.page,
          totalPage: result.totalPages);
    });
  }

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await _resetList();
    _loadNextPage();
  }

  Future<void> _resetList() async {
    await _popularMoviePaginator.reset();
    await _searchMoviePaginator.reset();
    _movies.clear();
    await _loadNextPage();
  }

  Future<void> _loadNextPage() async {
    //урок 86 1:29:53
    if (isSearchMode) {
      await _searchMoviePaginator.loadNextPage();
      _movies = _searchMoviePaginator.data.map(_makeRowData).toList();
    } else {
      await _popularMoviePaginator.loadNextPage();
      _movies = _popularMoviePaginator.data.map(_makeRowData).toList();
    }
    notifyListeners();
  }

  MovieListRowData _makeRowData(Movie movie) {
    final releaseDate = movie.releaseDate;
    final releaseDateTitle =
        releaseDate != null ? _dateFormat.format(releaseDate) : '';

    return MovieListRowData(
      posterPath: movie.posterPath,
      id: movie.id,
      title: movie.title,
      releaseDate: releaseDateTitle,
      overview: movie.overview,
    );
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 500),
      () async {
        final searchQuery = text.isNotEmpty ? text : null;
        if (_searchQuery == searchQuery) return;
        _searchQuery = searchQuery;
        _movies.clear();
        if (isSearchMode) {
          await _searchMoviePaginator.reset();
        }
        _loadNextPage();
      },
    );
  }

  void showedMovieActIndex(int index) {
    if (index < _movies.length - 1) return;
    _loadNextPage();
  }
}