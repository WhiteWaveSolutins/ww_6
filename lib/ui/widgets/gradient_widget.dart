import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    required this.gradient,
    required this.child,
  });

  final Widget child;
  final Gradient gradient;

  factory GradientWidget.primary(Widget child) => GradientWidget(
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryGrad1,
            AppColors.primaryGrad2,
          ],
        ),
        child: child,
      );

  factory GradientWidget.black(Widget child) => GradientWidget(
        gradient: LinearGradient(
          colors: [
            AppColors.black,
            AppColors.black.withOpacity(.5),
          ],
        ),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
