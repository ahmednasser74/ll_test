import 'package:dartz/dartz.dart';
import 'package:ll_test/core/error/failures.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/add_watched_movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/request/movie_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/watched_movies/watched_movies_request_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieResponseModel>> getMovies({
    required MovieRequestModel requestModel,
  });

  Future<Either<Failure, MovieResponseModel>> getWatchedMovies({
    required WatchedMoviesRequestModel requestModel,
  });

  Future<Either<Failure, AddWatchedMovieResponseModel>> addWatchedMovies({
    required AddWatchedMoviesRequestModel requestModel,
  });
}
