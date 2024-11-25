import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';

class AppToast extends StatelessWidget {
  final String text;
  final Color color;

  const AppToast({
    super.key,
    required this.text,
    this.color = AppColors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: AppText.text2.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showAppToast(String text) {
  showToastWidget(
    AppToast(text: text),
    position: ToastPosition.bottom,
  );
}

void showAppToastGreen(String text) {
  showToastWidget(
    AppToast(
      text: text,
      color: AppColors.green,
    ),
    position: ToastPosition.bottom,
  );
}
