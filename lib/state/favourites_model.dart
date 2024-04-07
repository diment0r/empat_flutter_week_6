import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:flutter/material.dart';

class FavoutritesModel extends ChangeNotifier {
  final List<ProductModel> _favourites = [];

  void addToFavourite(ProductModel product) {
    _favourites.add(product);
    notifyListeners();
  }

  void removeFromFavourite(ProductModel product) {
    _favourites.remove(product);
    notifyListeners();
  }

  List<ProductModel> get favourites => _favourites;
}