import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<ProductModel> _cart = [];

  void addToBasket(ProductModel product) {
    ProductModel productModel = ProductModel(
      name: product.name,
      sizes: product.sizes,
      price: product.price,
      imageAsset: product.imageAsset,
      selectedSize: product.selectedSize,
    );
    _cart.add(productModel);
    notifyListeners();
  }

  void removeFromBasket(ProductModel product) {
    _cart.remove(product);
    notifyListeners();
  }

  List<ProductModel> get cart => _cart;
}
