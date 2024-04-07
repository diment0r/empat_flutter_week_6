import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double? iconSize;
  final double? fontSize;
  final double borderRadius;
  final String buttonText;
  final IconData icon;

  final ProductModel? product;
  final CartModel? cartModel;

  const CustomButtonWidget({
    super.key,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 50,
    this.iconSize,
    this.fontSize,
    this.borderRadius = 15,
    this.buttonText = 'Add to basket',
    this.icon = Icons.add_shopping_cart,
    this.product,
    this.cartModel,
  });

  void onTap() {
    if(cartModel != null && product != null) {
      cartModel!.addToBasket(product!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: CColors.dark,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 0,
                    child: Icon(icon, color: CColors.light, size: iconSize)),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: CColors.light,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
