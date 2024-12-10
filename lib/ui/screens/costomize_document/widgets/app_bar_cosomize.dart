import 'package:flutter/material.dart';

class AppBarCosomize extends StatelessWidget {
  final Function() onClose;
  final Function() onFinish;

  const AppBarCosomize({
    super.key,
    required this.onFinish,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.1),
              ),
              child: const Icon(Icons.clear),
            ),
          ),
          GestureDetector(
            onTap: onFinish,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.1),
              ),
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}