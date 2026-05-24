import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/colors_manager.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final Color? topLeftColor;
  final Color? bottomRightColor;
  final double topLeftOpacity;
  final double bottomRightOpacity;
  final bool topLeftSolid;
  final bool bottomRightSolid;

  const AppBackground({
    super.key,
    required this.child,
    this.topLeftColor,
    this.bottomRightColor,
    this.topLeftOpacity = 0.32,
    this.bottomRightOpacity = 0.25,
    this.topLeftSolid = false,
    this.bottomRightSolid = false,
  });

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery لجعل حجم وموقع الدوائر متجاوباً مع مقاسات الشاشات المختلفة
    final double screenWidth = MediaQuery.of(context).size.width;

    // حساب حجم الدائرتين بنسب مئوية من عرض الشاشة
    final double topLeftSize =
        screenWidth *
        0.8; // يمثل 80% من عرض الشاشة (تقريباً 300 في الشاشات العادية)
    final double bottomRightSize =
        screenWidth *
        0.7; // يمثل 70% من عرض الشاشة (تقريباً 260 في الشاشات العادية)

    // إذا لم يقم المستخدم بتمرير الألوان (أي قيمتها null)، نستخدم الألوان الافتراضية
    final Color resolvedTopLeftColor =
        topLeftColor ?? ColorsManager.topLeftCircleColor;
    final Color resolvedBottomRightColor =
        bottomRightColor ?? ColorsManager.bottomRightCircleColor;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          // ── Top-left circle (solid or gradient) ──
          Positioned(
            top: -topLeftSize * 0.2, // إزاحة نسبية متناسقة مع حجم الدائرة
            left: -topLeftSize * 0.2,
            child: Container(
              width: topLeftSize,
              height: topLeftSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: topLeftSolid
                    ? resolvedTopLeftColor.withValues(alpha: topLeftOpacity)
                    : null,
                gradient: topLeftSolid
                    ? null
                    : RadialGradient(
                        colors: [
                          resolvedTopLeftColor.withValues(
                            alpha: topLeftOpacity,
                          ),
                          Colors.transparent,
                        ],
                      ),
              ),
            ),
          ),

          // ── Bottom-right circle (solid or gradient) ──
          Positioned(
            bottom:
                -bottomRightSize * 0.23, // إزاحة نسبية متناسقة مع حجم الدائرة
            right: -bottomRightSize * 0.23,
            child: Container(
              width: bottomRightSize,
              height: bottomRightSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bottomRightSolid
                    ? resolvedBottomRightColor.withValues(
                        alpha: bottomRightOpacity,
                      )
                    : null,
                gradient: bottomRightSolid
                    ? null
                    : RadialGradient(
                        colors: [
                          resolvedBottomRightColor.withValues(
                            alpha: bottomRightOpacity,
                          ),
                          Colors.transparent,
                        ],
                      ),
              ),
            ),
          ),

          // ── Content ──
          child,
        ],
      ),
    );
  }
}
