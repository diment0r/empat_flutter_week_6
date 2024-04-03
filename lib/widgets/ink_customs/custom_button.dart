import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double? iconSize;
  final double? fontSize;
  final double borderRadius;

  const CustomButtonWidget({
    super.key,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 50,
    this.iconSize,
    this.fontSize,
    this.borderRadius = 15,
  });

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
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 0,
                    child: Icon(Icons.add_shopping_cart,
                        color: CColors.light, size: iconSize)),
                Text(
                  'Add to basket',
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
