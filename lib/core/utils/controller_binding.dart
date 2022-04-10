import 'package:get/get.dart';
import 'package:ll_test/features/movies/presentation/controller/movie_controller.dart';
import 'package:ll_test/features/movies/presentation/controller/watched_movie_controller.dart';

import '../../features/auth/presentation/controller/login_controller.dart';
import 'injection_container.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Injection.di<LoginController>(), fenix: true);
    Get.lazyPut(() => Injection.di<MovieController>(), fenix: true);
    Get.lazyPut(() => Injection.di<WatchedMovieController>(), fenix: true);
  }
}
