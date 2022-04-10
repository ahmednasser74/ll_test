import 'package:dartz/dartz.dart';
import 'package:ll_test/core/error/failures.dart';
import 'package:ll_test/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/add_watched_movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/request/movie_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_response_model.dart';
import 'package:ll_test/features/movies/domin/repositories/movies_repository.dart';

import '../models/watched_movies/watched_movies_request_model.dart';

class MoviesRepositoryImp implements MoviesRepository {
  MoviesRepositoryImp({
    required this.moviesRemoteDataSource,
  });

  final MoviesRemoteDataSource moviesRemoteDataSource;

  @override
  Future<Either<Failure, MovieResponseModel>> getMovies({
    required MovieRequestModel requestModel,
  }) async {
    final response = await moviesRemoteDataSource.getMovies(
      requestModel: requestModel,
    );
    if (response.results.isNotEmpty) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieResponseModel>> getWatchedMovies({
    required WatchedMoviesRequestModel requestModel,
  }) async {
    final response = await moviesRemoteDataSource.getWatchedMovies(
      requestModel: requestModel,
    );
    if (response.results.isNotEmpty) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddWatchedMovieResponseModel>> addWatchedMovies({
    required AddWatchedMoviesRequestModel requestModel,
  }) async {
    final response = await moviesRemoteDataSource.addWatchedMovie(
      requestModel: requestModel,
    );
    if (response.success) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }
}
