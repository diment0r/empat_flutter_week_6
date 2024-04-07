import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomToggleWidget extends StatefulWidget {
  double minHeight;
  double minWidth;
  double fontSize;
  final List<String> sizes;
  Function setSize;

  CustomToggleWidget({
    super.key,
    required this.sizes,
    this.minHeight = 25,
    this.minWidth = 30,
    this.fontSize = 11,
    required this.setSize,
  });

  @override
  State<CustomToggleWidget> createState() => _CustomToggleWidgetState();
}

class _CustomToggleWidgetState extends State<CustomToggleWidget>
    with AutomaticKeepAliveClientMixin<CustomToggleWidget> {
  late final List<bool> selectedSizes;

  @override
  void initState() {
    selectedSizes = List.generate(widget.sizes.length, (index) => index == 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTogglePressed(int index) {
    setState(() {
      for (int i = 0; i < selectedSizes.length; i++) {
        selectedSizes[i] = i == index;
      }
      widget.setSize(widget.sizes[index]);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ToggleButtons(
      direction: Axis.horizontal,
      isSelected: selectedSizes,
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      constraints: BoxConstraints(
        minHeight: widget.minHeight,
        minWidth: widget.minWidth,
      ),
      selectedBorderColor: CColors.dark,
      selectedColor: CColors.light,
      fillColor: CColors.dark,
      color: CColors.dark,
      onPressed: onTogglePressed,
      children: widget.sizes
          .map(
            (size) => Text(
              size,
              style: TextStyle(
                  fontSize: widget.fontSize, fontWeight: FontWeight.w400),
            ),
          )
          .toList(),
    );
  }
}
