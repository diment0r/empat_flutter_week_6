import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/widgets/tile_customs/custom_cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPageWidget extends StatelessWidget {
  const CartPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: Consumer<CartModel>(
            builder: (context, cartModel, child) => SliverList.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cartModel.cart.length,
              itemBuilder: (context, index) => CustomCartTileWidget(
                key: Key("cart_product_${cartModel.cart[index].id}"),
                product: cartModel.cart[index],
                cartModel: cartModel,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
