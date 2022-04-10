import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_response_model.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class CreateSessionUseCase extends UseCase<
    Future<Either<Failure, CreateSessionResponseModel>>,
    CreateSessionRequestModel> {
  final AuthRepository authRepository;

  CreateSessionUseCase({required this.authRepository});

  @override
  Future<Either<Failure, CreateSessionResponseModel>> call({
    required CreateSessionRequestModel params,
  }) async =>
      await authRepository.createSession(createSessionRequestModel: params);
}
