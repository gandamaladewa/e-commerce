import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/config/routers/router.dart';
import 'package:to_do_list/app/config/routers/routes.dart';

List mangea = [1, 2, 3];
List carts = [];
void main() {
  addToCart();

  runApp(const MyApp());
}

void addToCart() {
  print(' Carrt awal =>  $carts');
  carts.add(mangea[0]);

  print(' Carrt Akhir =>  $carts');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.homeScreen.name,
      getPages: AppRouter.pages,
      title: 'eCommerce',
    );
  }
}
