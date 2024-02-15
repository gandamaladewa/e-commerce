import 'package:get/get.dart';
import 'package:to_do_list/app/modules/cart/controllers/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController());
  }
}
