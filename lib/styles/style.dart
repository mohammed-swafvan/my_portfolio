import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class Style {
  static final navBarDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Colors.transparent,
        CustomColors.bgLight1,
      ],
    ),
    borderRadius: BorderRadius.circular(100),
  );
}
