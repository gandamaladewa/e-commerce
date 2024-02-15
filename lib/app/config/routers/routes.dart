enum AppRoutes {
  homeScreen,
  cartScreen,
  addProducts,
  cameraPreview,
  shopScreen,
}

extension AppRoutersExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.homeScreen:
        return '/home-screen';
      case AppRoutes.cartScreen:
        return '/cart-screen';
      case AppRoutes.addProducts:
        return '/add-products';
      case AppRoutes.cameraPreview:
        return '/camera-preview';
      case AppRoutes.shopScreen:
        return '/shop-screen';
    }
  }
}
