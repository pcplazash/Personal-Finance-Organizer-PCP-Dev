import 'package:finance_app/core/themes/font_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;

  const FilterButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(height * 0.13, 32)),
          backgroundColor: MaterialStateProperty.all(color.primaryContainer)),
      child: Text(
        buttonText,
        style: smallFontStyle(context, const Color(0xff004B30)),
      ),
    );
  }
}
