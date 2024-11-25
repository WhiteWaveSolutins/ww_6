import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';

class LeftButton extends StatelessWidget {
  const LeftButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!getItService.navigatorService.canPop()) return Container();
    return Row(
      children: [
        const SizedBox(width: 16),
        CupertinoButton(
          onPressed: getItService.navigatorService.onPop,
          minSize: 1,
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.primary),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
