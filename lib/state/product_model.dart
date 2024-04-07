import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  final int _id;
  final String _name;
  final List<String> _sizes;
  final double _price;
  final String _imageAsset;
  final String _description =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
  static int counter = 0;
  late String _selectedSize;

  ProductModel({
    required String name,
    required List<String> sizes,
    required double price,
    required String imageAsset,
    String? selectedSize,
  })  : _id = counter++,
        _name = name,
        _sizes = [...sizes],
        _price = price,
        _imageAsset = imageAsset {
    _selectedSize = selectedSize ?? _sizes[0];
  }

  int get id => _id;
  String get name => _name;
  List<String> get sizes => _sizes;
  double get price => _price;
  String get imageAsset => _imageAsset;
  String get description => _description;
  String get selectedSize => _selectedSize;
  set selectedSize(String size) { 
    _selectedSize = size;
  } 
}
