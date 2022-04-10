import 'package:dartz/dartz.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_reponse_model.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_response_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_response_model.dart';
import 'package:ll_test/features/auth/data/models/request_token/request_token_response_model.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, RequestTokenResponseModel>> requestToken();

  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<Either<Failure, CreateSessionResponseModel>> createSession({
    required CreateSessionRequestModel createSessionRequestModel,
  });

  Future<Either<Failure, AccountDetailsResponseModel>> getAccountDetails({
    required AccountDetailsRequestModel accountDetailsRequestModel,
  });
}
