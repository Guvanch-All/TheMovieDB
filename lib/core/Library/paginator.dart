import 'package:the_movie_db/UI/widgets/movie_list/UI/domain/api_client/movie_api_client.dart';
import 'package:the_movie_db/domain/entity/movies.dart';
import 'package:the_movie_db/domain/entity/popular_movie_response.dart';

class PaginatorLoadResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPage;

  PaginatorLoadResult({
   required this.data,
   required this.currentPage,
   required this.totalPage,
  });
}

typedef PaginatorLoad<T> = Future<PaginatorLoadResult<T>> Function(int);

class Paginator<T> {
  final _data = <T>[];
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  final PaginatorLoad<T> load;

  List<T> get data => _data;
  Paginator(this.load);

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final result = await load(nextPage); //_loadMovies(nextPage, '_locale');
      _data.addAll(result.data);
      _currentPage = result.currentPage;
      _totalPage = result.totalPage;
      _isLoadingInProgress = false;
    } catch (e) {
      //TODO Уведемить пользователя об ошибке
      _isLoadingInProgress = false;
    }
  }

  Future<void> reset() async {
    _currentPage = 0;
    _totalPage = 1;
    _data.clear();
    await loadNextPage();
  }
}
