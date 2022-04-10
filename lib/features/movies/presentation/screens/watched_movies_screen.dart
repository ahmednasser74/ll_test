import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/src/widgets/loading_indicator_widget.dart';
import 'package:ll_test/features/movies/presentation/controller/watched_movie_controller.dart';
import 'package:ll_test/features/movies/presentation/widget/movie_item_widget.dart';

class WatchedMoviesScreen extends GetView<WatchedMovieController> {
  const WatchedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (movieList) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: movieList!.length,
                itemBuilder: (ctx, index) {
                  final movie = movieList.elementAt(index);
                  return MovieItemWidget(movie: movie, isMovieList: false);
                },
              ),
              onLoading: Center(child: LoadingIndicatorWidget()),
            ),
          ),
        ],
      ),
    );
  }
}
