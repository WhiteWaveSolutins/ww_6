import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/images.dart';

class StickerEditorWidget extends StatelessWidget {
  final Function(Widget) setLayer;

  const StickerEditorWidget({
    super.key,
    required this.setLayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      height: 80 + 60,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          for (int i = 3; i < 18; i++) ...[
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setLayer(
                  SizedBox(
                    width: 15,
                    child: Image.asset(
                      AppImages.sticker.replaceFirst('-', (i + 1).toString()),
                      width: 15,
                    ),
                  ),
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  AppImages.sticker.replaceFirst('-', (i + 1).toString()),
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
