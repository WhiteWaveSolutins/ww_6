import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';

class AppCloseButton extends StatelessWidget {
  final Function()? onClose;
  final double padding;
  final bool margin;

  const AppCloseButton({
    super.key,
    this.padding = 10,
    this.onClose,
    this.margin = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onClose ?? Navigator.of(context).pop,
      child: Container(
        margin: margin ? const EdgeInsets.only(left: 16) : null,
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
