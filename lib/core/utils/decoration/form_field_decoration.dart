import 'package:flutter/material.dart';

import '../../themes/font_theme.dart';

InputDecoration formFieldBoxDecoration(BuildContext context, String? hintText) {
  final color = Theme.of(context).colorScheme;

  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(),
    ),
    hintText: hintText,
    fillColor: Colors.grey,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.5), width: 1.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.primary.withOpacity(0.8), width: 1.4),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.onError.withOpacity(0.5), width: 1.4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color.onError.withOpacity(0.5), width: 1.4),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    errorStyle: smallFontStyle(context, color.onError),
  );
}
