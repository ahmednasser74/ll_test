import 'package:get/get.dart';
import 'package:ll_test/core/usecases/usecase.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/auth/data/models/account_details/account_details_request_model.dart';
import 'package:ll_test/features/auth/data/models/create_session/create_session_request_model.dart';
import 'package:ll_test/features/auth/data/models/login/login_request_model.dart';
import 'package:ll_test/features/auth/domain/use_case/account_details_usecase.dart';
import 'package:ll_test/features/auth/domain/use_case/create_session_usecase.dart';
import 'package:ll_test/features/auth/domain/use_case/login_usecase.dart';
import 'package:ll_test/features/auth/domain/use_case/request_token_usecase.dart';
import 'package:ll_test/features/movies/presentation/screens/movies_screen.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginUseCase,
    required this.accountDetailsUseCase,
    required this.requestTokenUseCase,
    required this.createSessionUseCase,
  });

  final LoginUseCase loginUseCase;
  final AccountDetailsUseCase accountDetailsUseCase;
  final RequestTokenUseCase requestTokenUseCase;
  final CreateSessionUseCase createSessionUseCase;

  RxBool isLoading = false.obs;
  String? requestTokenValue;
  String sessionIdValue = '90afc37c4c0aff55785693bacbc8a6cd1b73ee0c';

  @override
  void onInit() async {
    super.onInit();
    await requestToken();
    // await createSession();
    await accountDetails();
  }

  Future<void> requestToken() async {
    final token = await requestTokenUseCase(params: NoParams());
    token.fold(
      (l) => Get.snackbar('', l.message),
      (r) {
        print('token = ${r.requestToken}');
        this.requestTokenValue = r.requestToken;
      },
    );
  }

  Future<void> createSession() async {
    final createSession = await createSessionUseCase(
      params: CreateSessionRequestModel(requestToken: requestTokenValue ?? ''),
    );
    createSession.fold(
      (l) => Get.snackbar('', l.message),
      (r) {
        this.sessionIdValue = r.sessionId;
        SharedPrefs.instance.saveSessionId(r.sessionId);
      },
    );
  }

  Future<void> accountDetails() async {
    final accountDetails = await accountDetailsUseCase(
      /// set default session because api request always deny my session request
      params: AccountDetailsRequestModel(
        sessionId: sessionIdValue,
      ),
    );
    SharedPrefs.instance.saveSessionId(sessionIdValue);

    accountDetails.fold(
      (l) => Get.snackbar('', l.message),
      (r) => SharedPrefs.instance.saveUserId(r.id.toString()),
    );
  }

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    isLoading.value = true;
    final loginParams = LoginRequestModel(
      userName: userName,
      password: password,
      requestToken: requestTokenValue ?? '',
    );
    final login = await loginUseCase(params: loginParams);
    login.fold(
      (l) {
        isLoading.value = false;
        Get.snackbar('', l.message);
      },
      (r) {
        isLoading.value = false;
        SharedPrefs.instance.saveUserLogin(true);
        Get.offAll(MoviesScreen());
      },
    );
  }
}
