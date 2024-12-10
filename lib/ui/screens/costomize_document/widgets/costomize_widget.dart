import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class CostomizeWidget extends StatelessWidget {
  final String icon;
  final String title;

  const CostomizeWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(.1),
          ),
          padding: const EdgeInsets.all(20),
          child: SvgIcon(icon: icon),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppText.small,
        ),
      ],
    );
  }
}

class ConsomizeIcon extends StatelessWidget {
  final String icon;

  const ConsomizeIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(.1),
      ),
      padding: const EdgeInsets.all(20),
      child: SvgIcon(icon: icon),
    );
  }
}
