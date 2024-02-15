import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';

class Homebinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
