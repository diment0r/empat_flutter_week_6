import 'package:empat_flutter_week_6/data/data.dart';
import 'package:empat_flutter_week_6/widgets/tile_customs/custom_favourite_tile.dart';
import 'package:flutter/material.dart';

class FavouritesPageWidget extends StatelessWidget {
  final List<Product> userFavourites;
  final Function removeFromFavouritesStateFunction;

  const FavouritesPageWidget({
    super.key,
    required this.userFavourites,
    required this.removeFromFavouritesStateFunction,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: SliverList.separated(
            addAutomaticKeepAlives: true,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: userFavourites.length,
            itemBuilder: (context, index) => CustomFavouriteTileWidget(
              product: userFavourites[index],
              favourites: userFavourites,
              removeFromFavouritesStateFunction:
                  removeFromFavouritesStateFunction,
            ),
          ),
        ),
      ],
    );
  }
}
