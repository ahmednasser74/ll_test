import 'package:dartz/dartz.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/add_watched_movie_response_model.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/domin/repositories/movies_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AddWatchedMoviesUseCase extends UseCase<
    Future<Either<Failure, AddWatchedMovieResponseModel>>,
    AddWatchedMoviesRequestModel> {
  final MoviesRepository moviesRepository;

  AddWatchedMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, AddWatchedMovieResponseModel>> call({
    required AddWatchedMoviesRequestModel params,
  }) async =>
      await moviesRepository.addWatchedMovies(requestModel: params);
}
