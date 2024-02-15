import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/app/modules/cart/controllers/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cart'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 520,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                child: Obx(
                  () => ListView.builder(
                    itemCount:
                        controller.cartTotals.value?.cartList.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 84,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 235, 235),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              if (controller.cartTotals.value?.cartList[index]
                                      .image !=
                                  null)
                                Image.file(
                                  File(controller.cartTotals.value
                                          ?.cartList[index].image ??
                                      ''),
                                  fit: BoxFit.cover,
                                ),
                              if (controller.cartTotals.value?.cartList[index]
                                      .image ==
                                  null)
                                Image.network(
                                  'https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg',
                                  fit: BoxFit.fill,
                                ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.cartTotals.value?.cartList[index].name}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 235, 235, 235),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: const Offset(4, 0),
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: Colors.black45),
                                            ),
                                            child: Text(
                                              NumberFormat.currency(
                                                      locale: 'id_ID',
                                                      symbol: 'Rp',
                                                      decimalDigits: 0)
                                                  .format(controller
                                                      .cartTotals
                                                      .value!
                                                      .cartList[index]
                                                      .hargaJual),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 0.1,
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                controller.decrement();
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.1,
                                                ),
                                              ),
                                              child: Obx(
                                                () => Center(
                                                  child: Text(
                                                      "${controller.totalProduct.value}"),
                                                ),
                                              )),
                                          Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 0.1,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  controller.increment();
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 18,
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
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Sub Total',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Discount',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax 5%',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Tax 5%',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, bottom: 48),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.infinity,
            height: 42,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 89, 54, 244),
            ),
            child: InkWell(
              onTap: () {},
              child: const Center(
                child: Text(
                  'CHECKOUT',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
