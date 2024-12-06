import 'dart:io';
import 'dart:typed_data';

import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/crop_editor.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/filter_editor.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

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
        appBarWidgetCrop: const AppBarEditor(
          title: 'Cut',
          icon: AppIcons.cut,
        ),
        configs: ProImageEditorConfigs(
          tuneEditorConfigs: const TuneEditorConfigs(enabled: false),
          blurEditorConfigs: const BlurEditorConfigs(enabled: false),
          filterEditorConfigs: const FilterEditorConfigs(),
          icons: const ImageEditorIcons(
            cropRotateEditor: IconsCropRotateEditor(bottomNavBar: Icons.abc),
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

class AppBarEditor extends StatelessWidget {
  final String icon;
  final String title;

  const AppBarEditor({
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
