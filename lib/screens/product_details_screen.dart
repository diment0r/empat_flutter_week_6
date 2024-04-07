import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/state/favourites_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:empat_flutter_week_6/utils/product_screen_args.dart';
import 'package:empat_flutter_week_6/widgets/custom_toggle.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_button.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreenWidget extends StatelessWidget {
  const ProductDetailsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final ProductScreenArguments arguments =
        (ModalRoute.of(context)?.settings.arguments) as ProductScreenArguments;

    ProductModel product = arguments.product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.dark,
        foregroundColor: CColors.light,
        surfaceTintColor: Colors.transparent,
        title: Text(product.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<FavoutritesModel>(
              builder: (context, favouritesModel, child) => CustomIconButton(
                product: product,
                favouritesModel: favouritesModel,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.dark,
        foregroundColor: CColors.light,
        onPressed: () {
          cartModel.addToBasket(product);
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'Dash${product.id}',
              child: Image.asset(product.imageAsset),
            ),
            DetailsBodyWidget(
              product: product,
              cartModel: cartModel,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsBodyWidget extends StatelessWidget {
  final ProductModel product;
  final CartModel cartModel;

  void setSize(String size) {
    product.selectedSize = size;
  }

  const DetailsBodyWidget({
    super.key,
    required this.product,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
            setSize: setSize,
          ),
          CustomButtonWidget(
            cartModel: cartModel,
            product: product,
          ),
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
