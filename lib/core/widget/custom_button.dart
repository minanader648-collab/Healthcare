import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/colors_manager.dart';
import 'package:healthcare/core/widget/textstyle_manager.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.buttonColor,
        // العرض والارتفاع
        minimumSize: Size(screenWidth * 0.8, 60),

        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      onPressed: onPressed,

      child: Text(text, style: TextstyleManager.bottomTextStyle),
    );
  }
}
