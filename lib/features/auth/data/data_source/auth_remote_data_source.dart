import 'package:ll_test/features/auth/data/models/account_details/account_details_reponse_model.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_response_model.dart';
import 'package:ll_test/features/auth/data/models/request_token/request_token_response_model.dart';

import '../../../../core/utils/dio_helper.dart';
import '../../../../core/utils/end_points.dart';
import '../models/create_session/create_session_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RequestTokenResponseModel> requestToken();

  Future<LoginResponseModel> login({
    required LoginRequestModel loginRequestModel,
  });

  Future<CreateSessionResponseModel> createSession({
    required CreateSessionRequestModel createSessionRequestModel,
  });

  Future<AccountDetailsResponseModel> getAccountDetails({
    required AccountDetailsRequestModel accountDetailsRequestModel,
  });
}

class AuthRemoteDataSourceImp extends DioHelper
    implements AuthRemoteDataSource {
  @override
  Future<RequestTokenResponseModel> requestToken() async {
    final response = await getData(path: EndPoints.requestToken);
    final json = response.data;
    final data = RequestTokenResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<CreateSessionResponseModel> createSession({
    required CreateSessionRequestModel createSessionRequestModel,
  }) async {
    final response = await postData(
      path: EndPoints.createSession,
      data: createSessionRequestModel.toJson(),
    );
    final json = response.data;
    final data = CreateSessionResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<AccountDetailsResponseModel> getAccountDetails({
    required AccountDetailsRequestModel accountDetailsRequestModel,
  }) async {
    final response = await getData(
      path: EndPoints.accountDetails(
        sessionId: accountDetailsRequestModel.sessionId,
      ),
    );
    final json = response.data;
    final data = AccountDetailsResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<LoginResponseModel> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    final response = await postData(
      path: EndPoints.login,
      data: loginRequestModel.toJson(),
    );
    final data = LoginResponseModel.fromJson(response.data);
    return data;
  }
}
