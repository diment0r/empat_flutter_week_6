import 'package:empat_flutter_week_6/state/product_model.dart';

abstract class AppData {
  static final List<ProductModel> products = [
    ProductModel(
      name: 'T-Shirt',
      sizes: ['XS', 'XM', 'XXS'],
      price: 700,
      imageAsset: 'images/jacket.jpg',
    ),
    ProductModel(
      name: 'Shoes',
      sizes: ['42', '44', '46', '48'],
      price: 1560,
      imageAsset: 'images/shoes.jpg',
    ),
    ProductModel(
      name: 'Pants',
      sizes: ['M', 'L', 'XL'],
      price: 230,
      imageAsset: 'images/pants.jpg',
    ),
    ProductModel(
      name: 'Glasses',
      sizes: ['140', '142'],
      price: 450,
      imageAsset: 'images/glasses.jpg',
    ),
    ProductModel(
      name: 'Gloves',
      sizes: ['39', '40', '41'],
      price: 900,
      imageAsset: 'images/gloves.jpg',
    ),
    ProductModel(
      name: 'Hat',
      sizes: ['48'],
      price: 1020,
      imageAsset: 'images/hat.jpg',
    ),
  ];
}