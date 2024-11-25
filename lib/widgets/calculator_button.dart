import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class CalculatorButton extends StatelessWidget {

  final String? label;
  final Function()? onPressed;
  final Color? labelColor;
  final Color? bgColor;

  const CalculatorButton({
    super.key, 
    required this.label,
    this.onPressed,
    this.labelColor, 
    this.bgColor});

  @override
  Widget build(BuildContext context) {

    ThemeController themeController = Get.put(ThemeController());
    var size = Get.size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(label!,
            style: TextStyle(
              color: labelColor ?? (themeController.isDarkMode.value 
                            ? Colors.white : Colors.black),
              fontSize: size.width * 0.065,
            ),
          ),
        ),
        ),
    );
  }
}