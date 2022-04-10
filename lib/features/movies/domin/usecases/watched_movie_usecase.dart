import 'package:dartz/dartz.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/watched_movies/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/domin/repositories/movies_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class WatchedMoviesUseCase extends UseCase<
    Future<Either<Failure, MovieResponseModel>>, WatchedMoviesRequestModel> {
  final MoviesRepository moviesRepository;

  WatchedMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, MovieResponseModel>> call({
    required WatchedMoviesRequestModel params,
  }) async =>
      await moviesRepository.getWatchedMovies(requestModel: params);
}
