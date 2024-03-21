import 'package:flutter/material.dart';

import '../../core/themes/font_theme.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary.withOpacity(0.7),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: color.outline,
              size: 24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.2,
            decoration: BoxDecoration(
                color: color.primary.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(height * 0.032),
                    bottomRight: Radius.circular(height * 0.032))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Personal Finance Organizer',
                      style: bodyFontStyle(context, color.outline)),
                  Text('PCP-Dev',
                      style: bodyFontStyle(context, color.outline))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
