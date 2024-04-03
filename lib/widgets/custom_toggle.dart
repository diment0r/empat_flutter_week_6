import 'package:empat_flutter_week_6/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleWidget extends StatefulWidget {
  double minHeight;
  double minWidth;
  double fontSize;

  final List<String> sizes;
  late List<bool> selectedSizes;
  CustomToggleWidget({
    super.key,
    required this.sizes,
    this.minHeight = 25,
    this.minWidth = 30,
    this.fontSize = 11,
  }) {
    selectedSizes = List.generate(sizes.length, (index) => index == 0);
  }

  @override
  State<CustomToggleWidget> createState() => _CustomToggleWidgetState();
}

// ??? Exception  isSelected.lenght == children.lenght not true (Toggle)
// ! Суть ошибки в том что когда я удаляю элемент из списка состояние элемента под удаляемым сбрасывается
// ! Поэтому я вынес генерирование list<bool> в конструктор, в CustomIconButton тоже самое, фактически это костыль

class _CustomToggleWidgetState extends State<CustomToggleWidget>
    with AutomaticKeepAliveClientMixin<CustomToggleWidget> {
  // late final List<bool> selectedSizes;

  @override
  void initState() {
    // selectedSizes = List.generate(widget.sizes.length, (index) => false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTogglePressed(int index) {
    setState(() {
      for (int i = 0; i < widget.selectedSizes.length; i++) {
        widget.selectedSizes[i] = i == index;
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ToggleButtons(
      direction: Axis.horizontal,
      isSelected: widget.selectedSizes,
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
              style: TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w400),
            ),
          )
          .toList(),
    );
  }
}
