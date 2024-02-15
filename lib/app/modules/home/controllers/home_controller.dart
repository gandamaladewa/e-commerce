import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_list/app/modules/models/product_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxList<ProductModels> products = RxList<ProductModels>([]);
  RxBool isLoadingAddItem = false.obs;
  RxBool isLoadingDeleteItem = false.obs;
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  Rx<XFile?> pickedImage = Rx<XFile?>(null);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    products.value = await getProducts();
  }

  void openGallery() async {
    final picker = ImagePicker();
    final images = await picker.pickMedia(
      requestFullMetadata: false,
      imageQuality: 100,
    );

    if (images != null) {
      pickedImage.value = XFile(images.path);
    }
  }

  String generateProductsId() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNumber = Random().nextInt(10000);
    String productsId = '$timestamp$randomNumber';

    return productsId;
  }

  void addProduct() async {
    if (priceController.text.isNotEmpty &&
        double.tryParse(priceController.text) != null) {
      String? imagePath = pickedImage.value?.path;
      String productsId = generateProductsId();

      products.add(
        ProductModels(
          id: productsId,
          name: nameController.text,
          description: descriptionController.text,
          image: imagePath,
          hargaJual: double.tryParse(priceController.text),
        ),
      );
      Get.back();
    } else {
      Get.snackbar(
        'Error',
        'Name of products required or invalid price',
        duration: const Duration(seconds: 3),
      );
    }

    nameController.text = '';
    descriptionController.text = '';
    pickedImage.value = null;
    priceController.text = '';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsJsonList =
        products.map((product) => json.encode(product.tojson())).toList();
    await prefs.setStringList('products', productsJsonList);

    debugPrint('$productsJsonList');
  }

  void deleteProduct(int index) async {
    try {
      products.removeAt(index);
      await ProductService.saveProducts(products.toList());
      Get.snackbar('Success', 'Product deleted successfully');
    } catch (e) {
      debugPrint("Error deleting product: $e");
      Get.snackbar('Error', 'Failed to delete product');
    }
  }

  Future<List<ProductModels>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? productsJsonList = prefs.getStringList('products');
    if (productsJsonList == null) {
      return [];
    }

    List<ProductModels> products = [];
    for (String jsonString in productsJsonList) {
      try {
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        products.add(ProductModels.fromJson(jsonMap));
      } catch (e) {
        // Handle the parsing error (e.g., log the error, skip the item, etc.)
        print('Error parsing JSON: $e');
      }
    }
    return products;
  }
}

class ProductService {
  static Future<void> saveProducts(List<ProductModels> products) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsJsonList =
        products.map((product) => product.tojson().toString()).toList();
    await prefs.setStringList('products', productsJsonList);
  }
}
