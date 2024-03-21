import 'package:flutter/material.dart';

import '../../../core/themes/font_theme.dart';

class CategoryBox extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final String? selectedItem;
  final Function(String?)? onChanged;

  const CategoryBox(
      {Key? key,
      required this.items,
      required this.hintText,
      this.selectedItem,
      this.onChanged})
      : super(key: key);

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: height * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border:
                Border.all(width: 1.4, color: Colors.black.withOpacity(0.5))),
        child: DropdownButton<String>(
          iconEnabledColor: Colors.black,
          value: widget.selectedItem,
          isExpanded: true,
          underline: Container(),
          items: widget.items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('assets/images/$item.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item,
                          style: bodyFontStyle(context, color.outline),
                        )
                      ],
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (context) => widget.items
              .map(
                (selectedItem) => Row(
                  children: [
                    SizedBox(
                      width: height * 0.04,
                      height: height * 0.04,
                      child: Image.asset(
                        'assets/images/$selectedItem.png',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      selectedItem,
                      style: bodyFontStyle(context, Colors.black),
                    )
                  ],
                ),
              )
              .toList(),
          hint: Text(
            widget.hintText,
            style: bodyFontStyle(context, Colors.black.withOpacity(0.5)),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
