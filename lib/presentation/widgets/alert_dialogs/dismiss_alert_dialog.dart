import 'package:flutter/material.dart';
import '../../../core/themes/font_theme.dart';

class DismissAlertDialog extends StatelessWidget {
  const DismissAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return  AlertDialog(
      title: Text(
        "Confirm",
        style:
        titleFontStyle(context, color.outline),
      ),
      content: Text(
        "Are you sure you want to delete this item?",
        style:
        bodyFontStyle(context, color.outline),
      ),
      actions:[
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pop(false),
          child: Text(
            "Cancel",
            style: buttonFontStyle(
                context, color.tertiary),
          ),
        ),
        ElevatedButton(
          onPressed: () =>
              Navigator.of(context).pop(true),
          child: Text(
            "Delete",
            style: buttonFontStyle(
                context, color.tertiary),
          ),
        ),
      ],
    );
  }
}
