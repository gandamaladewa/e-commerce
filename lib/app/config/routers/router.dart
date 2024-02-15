import 'package:get/get.dart';
import 'package:to_do_list/app/config/routers/routes.dart';
import 'package:to_do_list/app/modules/cart/bindings/cart_binding.dart';
import 'package:to_do_list/app/modules/cart/pages/cart_screen.dart';
import 'package:to_do_list/app/modules/home/bindings/home_binding.dart';
import 'package:to_do_list/app/modules/home/home_screen.dart';
import 'package:to_do_list/app/modules/products/pages/add_products.dart';
import 'package:to_do_list/app/modules/shop/pages/shop_screen.dart';

import '../../modules/camera/camera_screen.dart';

class AppRouter {
  static final pages = [
    GetPage(
      name: AppRoutes.homeScreen.name,
      page: () => const HomeScreen(),
      binding: Homebinding(),
      bindings: [
        CartBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.cartScreen.name,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.addProducts.name,
      page: () => const AddProducts(),
    ),
    GetPage(
      name: AppRoutes.cameraPreview.name,
      page: () => const CameraPreviewScreen(),
    ),
    GetPage(
      name: AppRoutes.shopScreen.name,
      page: () => const ShopScreen(),
    ),
  ];
}
