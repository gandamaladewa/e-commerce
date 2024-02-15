import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/cart/models/cart_models.dart';
import 'package:to_do_list/app/modules/models/product_models.dart';

class CartController extends GetxController {
  Rx<CartModels?> cartTotals = Rx<CartModels?>(null);

  var subTotal = TextEditingController();
  var total = TextEditingController();
  var totalProduct = 0.obs;
  var itemCount = 0.obs;

  void increment() {
    totalProduct.value++;
  }

  void decrement() {
    if (totalProduct > 0) {
      totalProduct.value--;
    }
  }

  void addToCart(ProductModels products) {
    itemCount.value++;

    List<ProductModels> currentCart =
        List.from(cartTotals.value?.cartList ?? []);

    currentCart.add(ProductModels(
      image: products.image,
      name: products.name,
      description: products.description,
      hargaJual: products.hargaJual,
    ));

    cartTotals.value = CartModels(cartList: currentCart);

    update();

    debugPrint(
        'Ini product models sesuda => ${currentCart[0].image}, ${currentCart[0].name}, ${currentCart[0].description}, ${currentCart[0].hargaJual}  ');
  }
}
