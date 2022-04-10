import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/utils/helper_methods.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_item_model.dart';
import 'package:ll_test/features/movies/data/models/watched_movies/watched_movies_request_model.dart';
import 'package:ll_test/features/movies/domin/usecases/watched_movie_usecase.dart';

class WatchedMovieController extends GetxController
    with StateMixin<List<MovieItemModel>> {
  WatchedMovieController({required this.watchedMoviesUseCase});

  final WatchedMoviesUseCase watchedMoviesUseCase;
  final ScrollController scrollController = ScrollController();
  List<MovieItemModel> resultList = [];
  int page = 1;

  @override
  void onInit() async {
    super.onInit();
    await getWatchedMovies();
  }

  Future getWatchedMovies() async {
    change(null, status: RxStatus.loading());
    final requestParams = WatchedMoviesRequestModel(
      page: page,
      sessionId: SharedPrefs.instance.getSessionId(),
      accountId: SharedPrefs.instance.getUserId(),
    );
    final movie = await watchedMoviesUseCase(params: requestParams);
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
}
