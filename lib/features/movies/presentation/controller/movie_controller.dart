import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/utils/helper_methods.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/auth/presentation/screen/login_screen.dart';
import 'package:ll_test/features/movies/data/models/add_watched_movie/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/request/movie_request_model.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_item_model.dart';
import 'package:ll_test/features/movies/domin/usecases/add_watched_movie_usecase.dart';
import 'package:ll_test/features/movies/domin/usecases/movie_usecase.dart';

class MovieController extends GetxController
    with StateMixin<List<MovieItemModel>> {
  MovieController({
    required this.moviesUseCase,
    required this.addWatchedMoviesUseCase,
  });

  final MoviesUseCase moviesUseCase;
  final AddWatchedMoviesUseCase addWatchedMoviesUseCase;
  final ScrollController scrollController = ScrollController();
  List<MovieItemModel> resultList = [];
  RxBool paginationIndicatorVisibility = false.obs;
  int page = 1;

  @override
  void onInit() async {
    super.onInit();
    await getMovies();
    scrollController..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter <= 0) {
      getPaginationMovie();
    }
  }

  Future getMovies() async {
    change(null, status: RxStatus.loading());
    final movie = await moviesUseCase(
      params: MovieRequestModel(page: page),
    );
    movie.fold(
      (l) {
        change(resultList, status: RxStatus.error(l.message));
        HelperMethods.showToast(msg: l.message);
      },
      (r) {
        resultList = r.results;
        change(resultList, status: RxStatus.success());
      },
    );
  }

  Future<void> getPaginationMovie() async {
    page++;
    paginationIndicatorVisibility.value = true;
    final movie = await moviesUseCase(
      params: MovieRequestModel(page: page),
    );
    movie.fold(
      (l) {
        resultList = [];
        change(resultList, status: RxStatus.error(l.message));
        HelperMethods.showToast(msg: l.message);
      },
      (r) {
        paginationIndicatorVisibility.value = false;
        resultList.addAll(r.results);
        scrollController.animateTo(
          scrollController.position.pixels + 70,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        change(resultList, status: RxStatus.loadingMore());
      },
    );
  }

  Future<void> addWatchedMovie({required int movieId}) async {
    final requestParams = AddWatchedMoviesRequestModel(
      sessionId: SharedPrefs.instance.getSessionId(),
      accountId: SharedPrefs.instance.getUserId(),
      mediaId: movieId,
      mediaType: 'movie',
      watchList: true,
    );
    final movie = await addWatchedMoviesUseCase(
      params: requestParams,
    );
    movie.fold(
      (l) => HelperMethods.showToast(msg: 'Can not add this movie'),
      (r) => HelperMethods.showToast(msg: r.statusMessage),
    );
  }

  void logout() {
    SharedPrefs.instance.clearAllKeys();
    Get.offAll(LoginScreen());
  }
}
