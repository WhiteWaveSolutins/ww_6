import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onChanged;
  final Function()? onClear;

  const SearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppText.text16.copyWith(
        height: 1,
      ),
      onChanged: (_) => onChanged?.call(),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: onClear == null
            ? null
            : CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onClear,
                child: const Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: AppColors.red,
                ),
              ),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
