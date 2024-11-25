import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const SimpleButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Gaimon.selection();
        onPressed?.call();
      },
      minSize: 1,
      padding: EdgeInsets.zero,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.grey,
          gradient: onPressed == null
              ? null
              : const LinearGradient(
                  colors: [
                    AppColors.primaryGrad1,
                    AppColors.primaryGrad2,
                  ],
                ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppText.text16.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
