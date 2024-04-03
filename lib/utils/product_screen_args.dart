import 'package:empat_flutter_week_6/data/data.dart';

class ProductScreenArguments {
  final Product product;
  final List<Product> favourites;
  final Function addToFavouritesStateFunction;
  final Function removeFromFavouritesStateFunction;

  const ProductScreenArguments({
    required this.product,
    required this.favourites,
    required this.addToFavouritesStateFunction,
    required this.removeFromFavouritesStateFunction,
  });
}
