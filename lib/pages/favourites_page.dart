import 'package:empat_flutter_week_6/state/favourites_model.dart';
import 'package:empat_flutter_week_6/widgets/tile_customs/custom_favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPageWidget extends StatelessWidget {
  const FavouritesPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: Consumer<FavoutritesModel>(
            builder: (context, favouritesModel, child) => SliverList.separated(
              addAutomaticKeepAlives: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: favouritesModel.favourites.length,
              itemBuilder: (context, index) => CustomFavouriteTileWidget(
                key: Key(
                    "favourite_product_${favouritesModel.favourites[index].id}"),
                product: favouritesModel.favourites[index],
                favoutritesModel: favouritesModel,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
