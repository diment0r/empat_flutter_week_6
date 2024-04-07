import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomIconCloseButtonWidget extends StatelessWidget {
  final ProductModel product;
  final CartModel cartModel;

  const CustomIconCloseButtonWidget({
    super.key,
    required this.product,
    required this.cartModel,
  });

  void onTap() {
    cartModel.removeFromBasket(product);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        color: CColors.dark,
        Icons.close,
        size: 23,
      ),
    );
  }
}
