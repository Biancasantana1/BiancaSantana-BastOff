import '../models/collection_model.dart';

abstract class MoviesRepository {
  Future<Collection> getMovies();
}
