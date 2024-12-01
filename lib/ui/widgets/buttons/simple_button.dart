import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final String? icon;
  final bool isLoading;
  final Color? color;
  final Function()? onPressed;

  const SimpleButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        if (isLoading) return;
        Gaimon.selection();
        onPressed?.call();
      },
      minSize: 1,
      padding: EdgeInsets.zero,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color ?? AppColors.grey,
          gradient: (onPressed == null || color != null)
              ? null
              : const LinearGradient(
                  colors: [
                    AppColors.primaryGrad1,
                    AppColors.primaryGrad2,
                  ],
                ),
        ),
        child: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                  radius: 10,
                ),
              )
            : Row(
                mainAxisAlignment:
                    icon == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                children: [
                  if (icon != null)
                    Opacity(
                      opacity: 0,
                      child: SvgIcon(icon: icon!),
                    ),
                  Text(
                    title,
                    style: AppText.text16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  if (icon != null) SvgIcon(icon: icon!),
                ],
              ),
      ),
    );
  }
}
