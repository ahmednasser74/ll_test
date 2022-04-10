import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/data/models/login/login_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_response_model.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUseCase extends UseCase<Future<Either<Failure, LoginResponseModel>>,
    LoginRequestModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, LoginResponseModel>> call({
    required LoginRequestModel params,
  }) async =>
      await authRepository.login(loginRequestModel: params);
}
