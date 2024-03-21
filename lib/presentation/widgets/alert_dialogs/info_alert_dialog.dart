import 'package:flutter/material.dart';

import '../../../core/themes/font_theme.dart';

class InfoAlertDialog extends StatelessWidget {
  final String category;
  final String description;
  final String amount;
  final String type;
  final String date;

  const InfoAlertDialog(
      {Key? key,
      required this.category,
      required this.description,
      required this.amount,
      required this.type,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: color.secondaryContainer,
      title: Text(
        category,
        style: titleFontStyle(context, Colors.black),
      ),
      content: SizedBox(
        height: height * 0.19,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(type, context, color.secondary),
            customText('\$ $amount', context, color.secondary),
            customText(date, context, color.secondary),
            customText(description, context, color.secondary,
                maxLines: 2, textAlign: TextAlign.start),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(color.primaryContainer)),
          onPressed: () => Navigator.pop(context),
          child: SizedBox(
            width: height * 0.1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Ok",
                style: bodyFontStyle(context, color.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget customText(String text, BuildContext context, Color color,
    {int? maxLines, TextAlign? textAlign}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Text(
      text,
      style: bodyFontStyle(context, color),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
    ),
  );
}
