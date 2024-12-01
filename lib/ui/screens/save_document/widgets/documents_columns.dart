import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/gradient_widget.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:path/path.dart' as p;

class DocumentsColumns extends StatefulWidget {
  final List<String> images;
  final Function() onAdd;
  final Function(int) onDelete;
  final Function(int) onReplace;
  final Function() onRename;
  final Directory directory;
  final String nameDoc;

  const DocumentsColumns({
    super.key,
    required this.images,
    required this.onRename,
    required this.directory,
    required this.onAdd,
    required this.onDelete,
    required this.onReplace,
    required this.nameDoc,
  });

  @override
  State<DocumentsColumns> createState() => _DocumentsColumnsState();
}

class _DocumentsColumnsState extends State<DocumentsColumns> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: [
              for (var image in widget.images)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.file(
                      File(
                        p.join(widget.directory.path, image),
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: widget.onAdd,
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryGrad1,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.1),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: GradientWidget.primary(
                        const Icon(CupertinoIcons.plus),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: double.infinity,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, _) {
                Gaimon.selection();
                setState(() => selectedIndex = index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              Text(
                widget.nameDoc,
                style: AppText.text16,
              ),
              GestureDetector(
                onTap: widget.onRename,
                child: const SvgIcon(icon: AppIcons.edit),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Opacity(
          opacity: selectedIndex == widget.images.length ? 0 : 1,
          child: _Buttons(
            onDelete: () => widget.onDelete(selectedIndex),
            onReplace: () => widget.onReplace(selectedIndex),
          ),
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  final Function() onDelete;
  final Function() onReplace;

  const _Buttons({
    super.key,
    required this.onDelete,
    required this.onReplace,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onReplace,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: const SvgIcon(
              icon: AppIcons.retry,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: const SvgIcon(
            icon: AppIcons.edit,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onDelete,
          child: const SvgIcon(
            icon: AppIcons.basketFill,
          ),
        ),
      ],
    );
  }
}