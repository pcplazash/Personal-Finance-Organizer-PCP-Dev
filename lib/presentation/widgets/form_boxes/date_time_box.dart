import 'package:finance_app/core/themes/font_theme.dart';
import 'package:flutter/material.dart';

class DateTimeBox extends StatefulWidget {

  final String showDate;
  final Function()? onPressed;

   const DateTimeBox({Key? key,  required this.showDate, this.onPressed}) : super(key: key);

  @override
  State<DateTimeBox> createState() => _DateTimeBoxState();
}

class _DateTimeBoxState extends State<DateTimeBox> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.centerLeft,
      width: height * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1.4, color: Colors.black.withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.showDate,
            style: bodyFontStyle(context, Colors.black),
          ),
        ),
      ),
    );
  }
}
