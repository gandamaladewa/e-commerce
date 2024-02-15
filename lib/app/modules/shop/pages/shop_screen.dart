import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anu SHOP'),
        centerTitle: false,
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
        ],
      ),
    );
  }
}
