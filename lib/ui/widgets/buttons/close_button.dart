import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';

class AppCloseButton extends StatelessWidget {
  final Function()? onClose;
  final double padding;

  const AppCloseButton({
    super.key,
    this.padding = 10,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose ?? Navigator.of(context).pop,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white.withOpacity(.1),
        ),
        child: Icon(
          Icons.close,
          size: padding == 10 ? null : 16,
          color: AppColors.white,
        ),
      ),
    );
  }
}
