import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ll_test/features/auth/presentation/screen/login_screen.dart';
import 'package:ll_test/features/movies/presentation/screens/movies_screen.dart';

import '../../features/auth/presentation/screen/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen',
      loginScreen = '/loginScreen',
      movieScreen = '/movieScreen';

  static List<GetPage> setScreens() {
    return <GetPage>[
      GetPage(name: splashScreen, page: () => SplashScreen()),
      GetPage(name: movieScreen, page: () => MoviesScreen()),
      GetPage(name: loginScreen, page: () => LoginScreen()),
    ];
  }
}
