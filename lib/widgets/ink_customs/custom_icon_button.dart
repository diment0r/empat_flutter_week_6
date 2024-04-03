import 'package:empat_flutter_week_6/data/data.dart';
import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final Product _product;
  final List<Product> favourites;
  final Function? addToFavouritesStateFunction;
  final Function removeFromFavouritesStateFunction;
  bool isLiked = false;

  CustomIconButton({
    super.key,
    required Product product,
    required this.favourites,
    required this.addToFavouritesStateFunction,
    required this.removeFromFavouritesStateFunction,
  }) : _product = product {
    isLiked = favourites.contains(_product);
  }

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with AutomaticKeepAliveClientMixin<CustomIconButton> {
  // ? late bool isLiked; // тоже самое что и с toggle

  @override
  void initState() {
    // ? isLiked = widget.favourites.contains(widget._product);
    super.initState();
  }

  void onIconTap() {
    setState(() {
      if (!widget.isLiked && widget.addToFavouritesStateFunction != null) {
        widget.isLiked = true;
        widget.addToFavouritesStateFunction!(widget._product);
      } else {
        widget.isLiked = false;
        widget.removeFromFavouritesStateFunction(widget._product);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
            child: Icon(Icons.favorite,
                size: 23, color: widget.isLiked ? CColors.red : CColors.dark),
          ),
        ),
      ),
    );
  }
}
