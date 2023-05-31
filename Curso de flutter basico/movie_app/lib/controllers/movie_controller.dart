import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import '../models/collection_model.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Collection?> collection = ValueNotifier<Collection?>(null);
  Collection? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.parts
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    collection.value = collection.value!.copyWith(parts: list);
  }

  fetch() async {
    collection.value = await _moviesRepository.getMovies();
    _cachedMovies = collection.value;
  }
}
