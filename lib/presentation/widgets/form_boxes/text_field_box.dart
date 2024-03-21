import 'package:flutter/material.dart';

import '../../../core/themes/font_theme.dart';
import '../../../core/utils/decoration/form_field_decoration.dart';

class TextFieldBox extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;

  const TextFieldBox(
      {Key? key,
      required this.textEditingController,
      required this.focusNode,
      required this.hintText,
      this.keyboardType, this.validator, this.maxLength})
      : super(key: key);

  @override
  State<TextFieldBox> createState() => _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: height * 0.35,
      child: TextFormField(
        maxLength: widget.maxLength,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        style: bodyFontStyle(context, Colors.black),
        decoration: formFieldBoxDecoration(context, widget.hintText).copyWith(
            hintStyle: bodyFontStyle(context, Colors.black.withOpacity(0.5))),
      ),
    );
  }
}
