import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_reponse_model.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_request_model.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AccountDetailsUseCase extends UseCase<
    Future<Either<Failure, AccountDetailsResponseModel>>,
    AccountDetailsRequestModel> {
  final AuthRepository authRepository;

  AccountDetailsUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AccountDetailsResponseModel>> call({
    required AccountDetailsRequestModel params,
  }) async =>
      await authRepository.getAccountDetails(
        accountDetailsRequestModel: params,
      );
}
