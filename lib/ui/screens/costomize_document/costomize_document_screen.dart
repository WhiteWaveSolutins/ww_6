import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/app_bar_cosomize.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/buttons_history_costomize.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/costomize_widget.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/crop_editor.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/filter_editor.dart';

class CostomizeDocumentScreen extends StatelessWidget {
  final String image;

  const CostomizeDocumentScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProImageEditor.file(
        File(image),
        imageBack: AppImages.mainBack,
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: (Uint8List bytes) async {
            Navigator.pop(context);
          },
        ),
        buttonsHistory: (
          onPrev,
          onNext,
          activePrev,
          activeNext,
        ) =>
            ButtonsHistoryCostomize(
          onNext: onNext,
          onPrev: onPrev,
          activeNext: activeNext,
          activePrev: activePrev,
        ),
        bottomNavigationBarHeight: 125,
        bottomNavigationBarButtonsHeight: 90,
        appBarWidget: (onClose, onFinish) => PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: AppBarCosomize(
            onClose: onClose,
            onFinish: onFinish,
          ),
        ),
        appBarWidgetCrop: const CostomizeWidget(
          title: 'Cut',
          icon: AppIcons.cut,
        ),
        bottomTextStyle: AppText.small,
        configs: ProImageEditorConfigs(
          tuneEditorConfigs: const TuneEditorConfigs(enabled: false),
          blurEditorConfigs: const BlurEditorConfigs(enabled: false),
          emojiEditorConfigs: const EmojiEditorConfigs(enabled: false),
          stickerEditorConfigs: StickerEditorConfigs(
            enabled: true,
            buildStickers: (
              Function(Widget) setLayer,
              ScrollController scrollController,
            ) {
              return Container(
                color: Colors.yellow,
                width: double.infinity,
                height: 50,
                child: GestureDetector(
                  onTap: () => setLayer(Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  )),
                  child: Text(
                    'dsd',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
          ),
          filterEditorConfigs: const FilterEditorConfigs(),
          icons: const ImageEditorIcons(
            stickerEditor: IconsStickerEditor(
              bottomNavBar: ConsomizeIcon(icon: AppIcons.cut),
            ),
            cropRotateEditor: IconsCropRotateEditor(
              bottomNavBar: ConsomizeIcon(icon: AppIcons.cut),
            ),
            filterEditor: IconsFilterEditor(
              bottomNavBar: ConsomizeIcon(icon: AppIcons.filter),
            ),
            textEditor: IconsTextEditor(
              bottomNavBar: ConsomizeIcon(icon: AppIcons.text),
            ),
            paintingEditor: IconsPaintingEditor(
              bottomNavBar: ConsomizeIcon(icon: AppIcons.paint),
            ),
          ),
          customWidgets: ImageEditorCustomWidgets(
            filterEditor: appFilerEditor,
            cropRotateEditor: cropEditor,
          ),
        ),
      ),
    );
  }
}

class ButtonCloseFilter extends StatelessWidget {
  final Function() onTap;

  const ButtonCloseFilter({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ButtonCheckFilter extends StatelessWidget {
  final Function() onTap;

  const ButtonCheckFilter({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              AppColors.primaryGrad1,
              AppColors.primaryGrad2,
            ],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
