import 'package:get/get.dart';
import 'package:my_schedule/Pages/Dashboard_list_screen/Screen/dashboard_screen.dart';
import 'package:my_schedule/Pages/Sign_up_in/screen/sign_in_screen.dart';
import 'package:my_schedule/Pages/Splash/splash_binding.dart';
import 'package:my_schedule/Routes/route_name.dart';

import '../Pages/Dashboard_list_screen/Binding/dashboard_binding.dart';
import '../Pages/Intro/intro_screen.dart';
import '../Pages/Splash/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
      // binding: SplashB(),
    ),
    GetPage(
      name: RouteNames.introScreen,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: RouteNames.signInScreen,
      page: () => SignInScreen(),
      // binding: SignInB(),
    ),
    GetPage(
      name: RouteNames.dashBoardScreen,
      page: () => DashBoardScreen(),
      binding: DashBoardB(),
    ),
  ];
}
