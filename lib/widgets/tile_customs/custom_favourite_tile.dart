import 'package:empat_flutter_week_6/data/data.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:empat_flutter_week_6/widgets/custom_toggle.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_button.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_icon_button.dart';
import 'package:empat_flutter_week_6/widgets/loading/custom_octo.dart';
import 'package:flutter/material.dart';

class CustomFavouriteTileWidget extends StatelessWidget {
  final Product product;
  final List<Product> favourites;
  final Function removeFromFavouritesStateFunction;

  const CustomFavouriteTileWidget({
    super.key,
    required this.product,
    required this.favourites,
    required this.removeFromFavouritesStateFunction,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _TileImage(imageAsset: product.imageAsset),
          const SizedBox(width: 15),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: CustomIconButton(
                    product: product,
                    favourites: favourites,
                    addToFavouritesStateFunction: null,
                    removeFromFavouritesStateFunction:
                        removeFromFavouritesStateFunction,
                  ),
                ),
                _TileBody(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TileImage extends StatelessWidget {
  final String imageAsset;

  const _TileImage({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: CustomOctoImageWidget(
        imageHeight: 200,
        imageAsset: imageAsset,
        imageRadius: 13,
      ),
    );
  }
}

class _TileBody extends StatelessWidget {
  final Product product;

  const _TileBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.price}0 UAH',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(
              color: CColors.dark,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        CustomToggleWidget(
          sizes: product.sizes,
        ),
        const CustomButtonWidget(
          buttonWidth: 180,
          buttonHeight: 40,
          iconSize: 18,
          fontSize: 14,
          borderRadius: 13,
        ),
      ],
    );
  }
}
