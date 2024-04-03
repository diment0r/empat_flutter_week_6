import 'package:empat_flutter_week_6/data/data.dart';
import 'package:empat_flutter_week_6/utils/product_screen_args.dart';
import 'package:empat_flutter_week_6/widgets/tile_customs/custom_catalog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatalogPageWidget extends StatelessWidget {
  final User user;
  final List<Product> products;
  final Function addToFavouritesStateFunction;
  final Function removeFromFavouritesStateFunction;

  const CatalogPageWidget({
    super.key,
    required this.user,
    required this.products,
    required this.addToFavouritesStateFunction,
    required this.removeFromFavouritesStateFunction,
  });

  void onTileTap(BuildContext context, Product product) {
    Navigator.pushNamed(
      context,
      '/product-details',
      arguments: ProductScreenArguments(
        product: product,
        favourites: user.favourites,
        addToFavouritesStateFunction: addToFavouritesStateFunction,
        removeFromFavouritesStateFunction: removeFromFavouritesStateFunction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3 / 5,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    onTileTap(context, products[index]);
                  },
                  child: CustomCatalogTileWidget(
                    product: products[index],
                    favourites: user.favourites,
                    addToFavouritesStateFunction: addToFavouritesStateFunction,
                    removeFromFavouritesStateFunction:
                        removeFromFavouritesStateFunction,
                  ),
                );
              },
              childCount: products.length,
            ),
          ),
        ),
      ],
    );

    // return GridView.count(
    //   addAutomaticKeepAlives: true,
    //   childAspectRatio: 3 / 5,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //   crossAxisCount: 2,
    //   children: products
    //       .map(
    //         (product) => GestureDetector(
    //           onTap: () {
    //             onTileTap(context, product);
    //           },
    //           child: CustomCatalogTileWidget(
    //             product: product,
    //             favourites: user.favourites,
    //             addToFavouritesStateFunction: addToFavouritesStateFunction,
    //             removeFromFavouritesStateFunction:
    //                 removeFromFavouritesStateFunction,
    //           ),
    //         ),
    //       )
    //       .toList(),
    // );
  }
}
