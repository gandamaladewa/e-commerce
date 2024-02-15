import '../../models/product_models.dart';

class CartModels {
  List<ProductModels> cartList;
  double? subTotal;
  double? total;

  CartModels({
    required this.cartList,
    this.subTotal,
    this.total,
  });

  Map<String, dynamic> tojson() {
    return {
      'cartList': cartList,
      'subTotal': subTotal,
      'total': total,
    };
  }
}
