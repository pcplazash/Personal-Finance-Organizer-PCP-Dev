import 'package:finance_app/core/themes/font_theme.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function()? onPressed;

  const SaveButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    return SizedBox(
        width: height * 0.2,
        height: height * 0.06,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(color.primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          child: Text(
            'Save',
            style: subTitleFontStyle(context, Colors.white),
          ),
        ));
  }
}
