import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class ButtonsHistoryCostomize extends StatelessWidget {
  final Function() onPrev;
  final Function() onNext;
  final bool activePrev;
  final bool activeNext;

  const ButtonsHistoryCostomize({
    super.key,
    required this.activePrev,
    required this.onPrev,
    required this.onNext,
    required this.activeNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width - 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onNext,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black.withOpacity(.2),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 14,
              ),
              child: Opacity(
                  opacity: activeNext ? 1 : 0.3,
                  child: const SvgIcon(icon: AppIcons.turnRight)),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onPrev,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black.withOpacity(.2),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 14,
              ),
              child: Opacity(
                opacity: activePrev ? 1 : 0.3,
                child: const SvgIcon(icon: AppIcons.turnLeft),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
