import 'package:ll_test/core/utils/constant.dart';
import 'package:ll_test/core/utils/dio_helper.dart';
import 'package:ll_test/core/utils/end_points.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/add_watched_movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/request/movie_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/watched_movies/watched_movies_request_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponseModel> getMovies({
    required MovieRequestModel requestModel,
  });

  Future<MovieResponseModel> getWatchedMovies({
    required WatchedMoviesRequestModel requestModel,
  });

  Future<AddWatchedMovieResponseModel> addWatchedMovie({
    required AddWatchedMoviesRequestModel requestModel,
  });
}

class MoviesRemoteDataSourceImp extends DioHelper
    implements MoviesRemoteDataSource {
  @override
  Future<MovieResponseModel> getMovies({
    required MovieRequestModel requestModel,
  }) async {
    final response = await getData(
      path: EndPoints.movies + '?page=${requestModel.page}',
    );
    final data = MovieResponseModel.fromJson(response.data);
    return data;
  }

  @override
  Future<MovieResponseModel> getWatchedMovies({
    required WatchedMoviesRequestModel requestModel,
  }) async {
    final response = await getData(
      path:
          'account/${requestModel.accountId}/watchlist/movies?session_id=${requestModel.sessionId}?page=${requestModel.page}',
      queryParameters: {
        'api_key': Constant.apiKey,
        'session_id': requestModel.sessionId,
        'account_id': requestModel.accountId,
      },
    );
    final data = MovieResponseModel.fromJson(response.data);
    return data;
  }

  @override
  Future<AddWatchedMovieResponseModel> addWatchedMovie({
    required AddWatchedMoviesRequestModel requestModel,
  }) async {
    final response = await postData(
      path:
          'account/${requestModel.accountId}/watchlist?session_id=${requestModel.sessionId}',
      data: requestModel.toJson(),
      header: {
        'api_key': Constant.apiKey,
        'session_id': requestModel.sessionId,
        'account_id': requestModel.accountId,
      },
    );
    final data = AddWatchedMovieResponseModel.fromJson(response.data);
    return data;
  }
}
