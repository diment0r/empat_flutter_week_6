import 'package:empat_flutter_week_6/widgets/loading/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CustomOctoImageWidget extends StatelessWidget {
  final double imageHeight;
  final double imageRadius;
  final String imageAsset;

  const CustomOctoImageWidget({
    super.key,
    required this.imageHeight,
    required this.imageRadius,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(imageRadius)),
      child: OctoImage(
        fit: BoxFit.cover,
        image: AssetImage(imageAsset),
        placeholderBuilder: (context) => CustomShimmerWidget(
          height: imageHeight,
          radius: imageRadius,
        ),
      ),
    );
  }
}
