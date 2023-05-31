import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/apis.utils.dart';
import '../models/collection_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Collection> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Collection.fromJson(result.data);
  }
}
