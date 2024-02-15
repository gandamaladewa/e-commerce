import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';

class AddProducts extends GetView<HomeController> {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ADD A NEW PRODUCTS',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text(
                'Initiate the Creation of a New Product for Your inventory',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: InkWell(
                  onTap: () async {
                    controller.openGallery();
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Obx(
                      () {
                        if (controller.pickedImage.value == null) {
                          return Image.network(
                            'https://static.thenounproject.com/png/4974686-200.png',
                            fit: BoxFit.fill,
                          );
                        } else if (controller.pickedImage.value?.path != null) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Image.file(
                              File(controller.pickedImage.value!.path),
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return const Placeholder(); // You can replace this with any other widget or image you want to show as a placeholder or error image
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harap masukkan teks';
                        }
                        return null;
                      },
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Enter a name products',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Price'),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: controller.priceController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter valid number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Enter a sale price',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Description'),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: controller.descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'Enter a description',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, bottom: 36),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.infinity,
            height: 42,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 89, 54, 244),
            ),
            child: InkWell(
              onTap: () {
                controller.addProduct();
              },
              child: const Center(
                child: Text(
                  'Create Products',
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
