import 'package:empat_flutter_week_6/state/product_list_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/product_screen_args.dart';
import 'package:empat_flutter_week_6/widgets/tile_customs/custom_catalog_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CatalogPageWidget extends StatelessWidget {
  const CatalogPageWidget({
    super.key,
  });

  void onTileTap(BuildContext context, ProductModel product) {
    Navigator.pushNamed(
      context,
      '/product-details',
      arguments: ProductScreenArguments(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productListModel = Provider.of<ProductListModel>(context);

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
                    onTileTap(context, productListModel.products[index]);
                  },
                  child: CustomCatalogTileWidget(
                    product: productListModel.products[index],
                  ),
                );
              },
              childCount: productListModel.products.length,
            ),
          ),
        ),
      ],
    );
  }
}
