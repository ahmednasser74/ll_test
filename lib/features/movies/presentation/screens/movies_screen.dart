import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/src/widgets/loading_indicator_widget.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/auth/presentation/screen/login_screen.dart';
import 'package:ll_test/features/movies/presentation/controller/movie_controller.dart';
import 'package:ll_test/features/movies/presentation/screens/watched_movies_screen.dart';
import 'package:ll_test/features/movies/presentation/widget/movie_item_widget.dart';

class MoviesScreen extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    final isLogin = SharedPrefs.instance.getIsUserLogin();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (isLogin) {
            Get.to(WatchedMoviesScreen());
          } else {
            Get.offAll(LoginScreen());
          }
        },
        backgroundColor: Colors.red,
        label:
            isLogin ? Text('Watched List') : Text('Login to get watched list'),
        icon: const Icon(Icons.movie),
      ),
      appBar: AppBar(
        title: Text('Movie World', style: TextStyle(color: Colors.red)),
        actions: [
          Visibility(
            visible: isLogin,
            child: IconButton(
              onPressed: controller.logout,
              icon: Icon(Icons.logout, color: Colors.red),
            ),
          )
        ],
      ),
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
                  return MovieItemWidget(
                    movie: movie,
                    onTapAddMovie: () =>
                        controller.addWatchedMovie(movieId: movie.id),
                  );
                },
              ),
              onLoading: Center(child: LoadingIndicatorWidget()),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.paginationIndicatorVisibility.value,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 1.sw,
                child: CupertinoActivityIndicator(radius: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
