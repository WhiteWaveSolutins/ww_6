import 'package:flutter/cupertino.dart';
import 'package:scan_doc/ui/resurses/text.dart';

class FilterButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final String name;

  const FilterButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: SizedBox(
              height: 60,
              width: 60,
              child: child,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppText.small,
          ),
        ],
      ),
    );
  }
}
