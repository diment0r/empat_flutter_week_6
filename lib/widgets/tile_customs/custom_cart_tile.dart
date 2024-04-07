import 'package:empat_flutter_week_6/state/cart_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_button.dart';
import 'package:empat_flutter_week_6/widgets/ink_customs/custom_icon_close_button.dart';
import 'package:empat_flutter_week_6/widgets/loading/custom_octo.dart';
import 'package:flutter/material.dart';

class CustomCartTileWidget extends StatelessWidget {
  final ProductModel product;
  final CartModel cartModel;

  const CustomCartTileWidget({
    super.key,
    required this.product,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CustomOctoImageWidget(
              imageHeight: 100,
              imageRadius: 15,
              imageAsset: product.imageAsset,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: CustomIconCloseButtonWidget(
                    product: product,
                    cartModel: cartModel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _CustomRichText(
                          title: 'Price',
                          value: '${product.price} UAH',
                          fontSize: 16,
                        ),
                      ),
                      _CustomRichText(
                        title: 'Size',
                        value: product.selectedSize,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      _CustomRichText(
                        title: 'Product',
                        value: product.name,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: CustomButtonWidget(
                    buttonHeight: 35,
                    buttonWidth: 110,
                    buttonText: 'Buy',
                    icon: Icons.payment,
                    iconSize: 18,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String title;
  final String value;
  final double fontSize;
  final FontWeight fontWeight;

  const _CustomRichText({
    super.key,
    required this.title,
    required this.value,
    required this.fontSize,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
                color: CColors.dark,
                fontSize: fontSize,
                fontWeight: fontWeight),
          ),
          TextSpan(
            text: '$value',
            style: TextStyle(
              color: CColors.dark,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
