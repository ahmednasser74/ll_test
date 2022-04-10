import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_reponse_model.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_response_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_response_model.dart';
import 'package:ll_test/features/auth/data/models/request_token/request_token_response_model.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failures.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp({required this.remoteDataSource});

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, CreateSessionResponseModel>> createSession({
    required CreateSessionRequestModel createSessionRequestModel,
  }) async {
    final response = await remoteDataSource.createSession(
      createSessionRequestModel: createSessionRequestModel,
    );
    if (response.success) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AccountDetailsResponseModel>> getAccountDetails({
    required AccountDetailsRequestModel accountDetailsRequestModel,
  }) async {
    final response = await remoteDataSource.getAccountDetails(
      accountDetailsRequestModel: accountDetailsRequestModel,
    );
    return Right(response);
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    final response = await remoteDataSource.login(
      loginRequestModel: loginRequestModel,
    );
    if (response.success) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RequestTokenResponseModel>> requestToken() async {
    final response = await remoteDataSource.requestToken();
    if (response.success) {
      return Right(response);
    } else {
      return Left(ServerFailure());
    }
  }
}
