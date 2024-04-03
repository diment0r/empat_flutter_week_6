import 'package:empat_flutter_week_6/data/data.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:empat_flutter_week_6/utils/product_screen_args.dart';
import 'package:empat_flutter_week_6/widgets/custom_toggle.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_button.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenWidget extends StatelessWidget {
  const ProductDetailsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductScreenArguments arguments =
        (ModalRoute.of(context)?.settings.arguments) as ProductScreenArguments;

    Product product = arguments.product;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: CColors.dark,
          foregroundColor: CColors.light,
          title: Text(product.name),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomIconButton(
                product: product,
                favourites: arguments.favourites,
                addToFavouritesStateFunction:
                    arguments.addToFavouritesStateFunction,
                removeFromFavouritesStateFunction:
                    arguments.removeFromFavouritesStateFunction,
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.dark,
        foregroundColor: CColors.light,
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'Dash${product.id}',
              child: Image.asset(product.imageAsset),
            ),
            DetailsBodyWidget(product: product),
          ],
        ),
      ),
    );
  }
}

class DetailsBodyWidget extends StatelessWidget {
  final Product product;
  const DetailsBodyWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${product.price}0 UAH',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          CustomToggleWidget(
            sizes: product.sizes,
            minHeight: 30,
            minWidth: 45,
            fontSize: 13,
          ),
          const CustomButtonWidget(),
          const SizedBox(height: 20),
          Text(
            product.description,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
