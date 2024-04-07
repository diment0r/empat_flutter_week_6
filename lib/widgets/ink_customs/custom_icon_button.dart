import 'package:empat_flutter_week_6/state/favourites_model.dart';
import 'package:empat_flutter_week_6/state/product_model.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final ProductModel _product;
  final FavoutritesModel favouritesModel;

  const CustomIconButton({
    super.key,
    required ProductModel product,
    required this.favouritesModel,
  }) : _product = product;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with AutomaticKeepAliveClientMixin<CustomIconButton> {
  late bool isLiked;

  void onIconTap() {
    setState(() {
      if (!isLiked) {
        isLiked = true;
        widget.favouritesModel.addToFavourite(widget._product);
      } else {
        isLiked = false;
        widget.favouritesModel.removeFromFavourite(widget._product);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    isLiked =
        widget.favouritesModel.favourites.contains(widget._product);
    super.build(context);
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: CColors.light.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onIconTap,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Ink(
            child: Icon(
              Icons.favorite,
              size: 23,
              color: isLiked ? CColors.red : CColors.dark,
            ),
          ),
        ),
      ),
    );
  }
}
