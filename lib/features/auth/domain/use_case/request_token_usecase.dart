import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/request_token/request_token_response_model.dart';

class RequestTokenUseCase extends UseCase<
    Future<Either<Failure, RequestTokenResponseModel>>, NoParams> {
  final AuthRepository authRepository;

  RequestTokenUseCase({required this.authRepository});

  @override
  Future<Either<Failure, RequestTokenResponseModel>> call({
    required NoParams params,
  }) async =>
      await authRepository.requestToken();
}
