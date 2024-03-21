import 'package:flutter/material.dart';

import '../../core/data/utilities.dart';
import '../../core/themes/font_theme.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(children: [
          Container(
            width: double.infinity,
            height: height * 0.23,
            decoration: BoxDecoration(
              color: color.primary.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(height * 0.032),
                bottomRight: Radius.circular(height * 0.032),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Finance Organizer',
                        style: bodyFontStyle(context, color.outline),
                      ),
                      Text(
                        'PCP-Dev',
                        style: bodyFontStyle(context, color.outline),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
        Positioned(
          top: height * 0.13,
          left: (width - height * 0.4) / 2,
          child: Container(
            height: height * 0.215,
            width: height * 0.4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(3, 3),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
              color: color.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: bodyFontStyle(context, const Color(0xffFAFDFB)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text(
                        '\$ ${total()}',
                        style: titleFontStyle(context, const Color(0xffFAFDFB)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: height * 0.02,
                                backgroundColor: color.primaryContainer,
                                child: Icon(
                                  Icons.arrow_downward_sharp,
                                  color: color.tertiary,
                                  size: height * 0.03,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text('Incomes',
                                  style: bodyFontStyle(
                                      context, const Color(0xffFAFDFB))),
                            ],
                          ),
                          Text(
                            '\$ ${incomes()}',
                            style: bodyFontStyle(
                              context,
                              const Color(0xffFAFDFB),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: height * 0.02,
                                backgroundColor: color.primaryContainer,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: color.tertiary,
                                  size: height * 0.03,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Expenses',
                                style: bodyFontStyle(
                                  context,
                                  const Color(0xffFAFDFB),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${expenses()}',
                            style: bodyFontStyle(
                              context,
                              const Color(0xffFAFDFB),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
