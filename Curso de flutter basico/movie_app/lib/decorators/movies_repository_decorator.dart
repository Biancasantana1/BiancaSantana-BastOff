import 'package:movie_app/models/collection_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MoviesRepositoryDecorator(this._moviesRepository);
  @override
  Future<Collection> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
