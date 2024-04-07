import 'package:empat_flutter_week_6/state/favourites_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_icon_button.dart';
import 'package:empat_flutter_week_6/widgets/loading/custom_octo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ? Shimmer вместо текста и как это должно отображаться правильно? 

class CustomCatalogTileWidget extends StatelessWidget {
  final ProductModel product;

  const CustomCatalogTileWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TileImageWidget(
          product: product,
        ),
        _TileFooterWidget(
          product: product,
        ),
      ],
    );
  }
}

class _TileImageWidget extends StatelessWidget {
  final ProductModel product;

  const _TileImageWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Hero(
            tag: 'Dash${product.id}',
            child: SizedBox(
              height: 260,
              child: CustomOctoImageWidget(
                imageAsset: product.imageAsset,
                imageHeight: 260,
                imageRadius: 15,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Consumer<FavoutritesModel>(
              builder: (context, favouritesModel, child) => CustomIconButton(
                product: product,
                favouritesModel: favouritesModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TileFooterWidget extends StatelessWidget {
  final ProductModel product;
  const _TileFooterWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          product.name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          product.sizes.toString(),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
        Text(
          '${product.price}0 UAH',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}