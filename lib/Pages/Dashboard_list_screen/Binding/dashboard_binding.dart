import 'package:get/get.dart';

import '../Controller/dashboard_controller.dart';

class DashBoardB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardC>(() => DashBoardC());
  }
}
