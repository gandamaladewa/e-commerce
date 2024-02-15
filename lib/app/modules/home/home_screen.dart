import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/cart/controllers/cart_controller.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';
import '../../config/routers/routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController myController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
      appBar: AppBar(
        title: const Text('Store'),
        actions: [
          Stack(
            children: [
              Positioned(
                right: 6,
                child: Obx(
                  () => Visibility(
                    visible: controller.products.length > 0,
                    child: Badge(
                      label: Text(
                        myController.itemCount.value.toString(),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.cartScreen.name);
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: ListView(
          children: [
            ListTile(
              title: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.shopScreen.name);
                },
                child: const Text('List Products'),
              ),
            ),
            const ListTile(
              title: Text('List Users'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 62, 113),
        onPressed: () {
          Get.toNamed(AppRoutes.addProducts.name);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            var products = controller.products[index];
            return Container(
              width: double.infinity,
              height: 124,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    if (products.image != null)
                      Image.file(
                        File(products.image!),
                        fit: BoxFit.cover,
                      ),
                    if (products.image == null)
                      Image.network(
                        'https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg',
                        fit: BoxFit.fill,
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${products.name}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.deleteProduct(index);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 32,
                                    width: 32,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 0, 62, 113),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${products.description}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 0, 62, 113),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: const Offset(4, 0),
                                      ),
                                    ],
                                    border: Border.all(color: Colors.black45),
                                  ),
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(products.hargaJual),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      myController.addToCart(products);
                                    },
                                    child: Container(
                                      width: 42,
                                      height: 32,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                        ),
                                        color: Color.fromARGB(255, 0, 62, 113),
                                      ),
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
