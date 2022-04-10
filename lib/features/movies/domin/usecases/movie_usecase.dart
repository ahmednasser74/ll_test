import 'package:dartz/dartz.dart';
import 'package:ll_test/features/movies/data/models/movies/request/movie_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_response_model.dart';
import 'package:ll_test/features/movies/domin/repositories/movies_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class MoviesUseCase extends UseCase<Future<Either<Failure, MovieResponseModel>>,
    MovieRequestModel> {
  final MoviesRepository moviesRepository;

  MoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, MovieResponseModel>> call({
    required MovieRequestModel params,
  }) async =>
      await moviesRepository.getMovies(requestModel: params);
}
