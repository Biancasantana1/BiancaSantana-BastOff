import 'dart:convert';
import 'package:movie_app/decorators/movies_repository_decorator.dart';
import 'package:movie_app/models/collection_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(super.moviesRepository);

  @override
  Future<Collection> getMovies() async {
    try {
      Collection movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Collection movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    //print('Salvou no cache' + jsonMovies);
  }

  Future<Collection> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('moveis_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = Collection.fromJson(json);
    //print('Recuperou' + movies.toString());
    return movies;
  }
}
