import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/custom_draggable.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/gradient_widget.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class DocumentsGrid extends StatelessWidget {
  final List<String> images;
  final Function() onAdd;
  final ScrollController scrollController;
  final Function(List<String>) reorder;
  final bool isDelete;
  final List<String> deleting;
  final Function() onSwitchDelete;
  final Function(String) onSelectDelete;

  const DocumentsGrid({
    super.key,
    required this.images,
    required this.deleting,
    required this.scrollController,
    required this.onAdd,
    required this.reorder,
    required this.isDelete,
    required this.onSwitchDelete,
    required this.onSelectDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ReorderableBuilder(
            lockedIndices: const [3],
            nonDraggableIndices: isDelete ? List.generate(images.length, (v) => v) : [],
            scrollController: scrollController,
            onReorder: (ReorderedListFunction reorderedListFunction) {
              final newImages = reorderedListFunction(images) as List<String>;
              reorder(newImages);
            },
            builder: (children) {
              return GridView(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 230,
                ),
                children: children,
              );
            },
            children: [
              for (int i = 0; i < images.length; i++)
                CustomDraggable(
                  key: Key(images[i].toString()),
                  data: i,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (isDelete) onSelectDelete(images[i]);
                    },
                    child: _Item(
                      data: images[i],
                      isDeleting: deleting.contains(images[i]),
                      index: i + 1,
                    ),
                  ),
                ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onAdd,
                key: const Key('Add'),
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(30),
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
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onSwitchDelete,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(isDelete ? 1 : .1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(18),
              child: SvgIcon(
                icon: AppIcons.doubleCheck,
                color: isDelete ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String data;
  final int index;
  final bool isDeleting;

  const _Item({
    super.key,
    required this.data,
    required this.index,
    required this.isDeleting,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 370,
            height: 230,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDeleting ? AppColors.primaryGrad1 : Colors.transparent,
                width: 3,
              ),
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.memory(
                File(data).readAsBytesSync(),
                width: 370,
                fit: BoxFit.fitWidth,
                height: 230,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            index.toString(),
            style: AppText.text2bold,
          ),
        ),
      ],
    );
  }
}
