import 'package:get/get.dart';
import 'package:my_schedule/Pages/Splash/splash_binding.dart';
import 'package:my_schedule/Routes/route_name.dart';

import '../Pages/Splash/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
      // binding: SplashB(),
    )
  ];
}
