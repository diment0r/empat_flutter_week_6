import 'package:empat_flutter_week_6/state/data.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:flutter/material.dart';

class ProductListModel extends ChangeNotifier {
  List<ProductModel> _products = [];

  ProductListModel() {
    _products = AppData.products;
    notifyListeners();
  }

  List<ProductModel> get products => _products;
}