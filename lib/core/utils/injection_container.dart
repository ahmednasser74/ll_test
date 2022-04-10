import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ll_test/core/localization/translation_controller.dart';
import 'package:ll_test/core/network/network_information.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ll_test/features/auth/data/repository/auth_repository_imp.dart';
import 'package:ll_test/features/auth/domain/repository/auth_repository.dart';
import 'package:ll_test/features/auth/domain/use_case/account_details_usecase.dart';
import 'package:ll_test/features/auth/domain/use_case/request_token_usecase.dart';
import 'package:ll_test/features/auth/presentation/controller/login_controller.dart';
import 'package:ll_test/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:ll_test/features/movies/data/repositories/movies_repository_imp.dart';
import 'package:ll_test/features/movies/domin/repositories/movies_repository.dart';
import 'package:ll_test/features/movies/domin/usecases/add_watched_movie_usecase.dart';
import 'package:ll_test/features/movies/domin/usecases/movie_usecase.dart';
import 'package:ll_test/features/movies/domin/usecases/watched_movie_usecase.dart';
import 'package:ll_test/features/movies/presentation/controller/movie_controller.dart';
import 'package:ll_test/features/movies/presentation/controller/watched_movie_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/use_case/create_session_usecase.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';

class Injection {
  static final di = GetIt.instance;

  static Future<void> init() async {
    await _core();
    _authFeature();
    _movieFeature();
  }

  static Future<void> _core() async {
    // shared preference
    await SharedPrefs.instance.init();
    final sharedPreferences = await SharedPreferences.getInstance();
    di.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    // localization
    di.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );
    //controller
    di.registerFactory<TranslationController>(() => TranslationController());
    //  check network connection
    di.registerFactory<NetworkInformation>(
      () => NetworkInformationImp(internetConnectionChecker: di()),
    );
  }

  static void _authFeature() {
    // Controller
    di.registerFactory<LoginController>(
      () => LoginController(
        loginUseCase: di(),
        accountDetailsUseCase: di(),
        createSessionUseCase: di(),
        requestTokenUseCase: di(),
      ),
    );

    // Use cases
    di.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: di()),
    );

    di.registerLazySingleton<CreateSessionUseCase>(
      () => CreateSessionUseCase(authRepository: di()),
    );

    di.registerLazySingleton<AccountDetailsUseCase>(
      () => AccountDetailsUseCase(authRepository: di()),
    );

    di.registerLazySingleton<RequestTokenUseCase>(
      () => RequestTokenUseCase(authRepository: di()),
    );

    //repo
    di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        remoteDataSource: di(),
      ),
    );

    // Data sources
    di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
  }

  static void _movieFeature() {
    // Controller
    di.registerFactory<MovieController>(
      () => MovieController(
        moviesUseCase: di(),
        addWatchedMoviesUseCase: di(),
      ),
    );
    di.registerFactory<WatchedMovieController>(
      () => WatchedMovieController(
        watchedMoviesUseCase: di(),
      ),
    );

    // Use cases
    di.registerLazySingleton<MoviesUseCase>(
      () => MoviesUseCase(moviesRepository: di()),
    );
    di.registerLazySingleton<WatchedMoviesUseCase>(
      () => WatchedMoviesUseCase(moviesRepository: di()),
    );

    di.registerLazySingleton<AddWatchedMoviesUseCase>(
      () => AddWatchedMoviesUseCase(moviesRepository: di()),
    );

    //repo
    di.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImp(
        moviesRemoteDataSource: di(),
      ),
    );

    // Data sources
    di.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImp(),
    );
  }
}
