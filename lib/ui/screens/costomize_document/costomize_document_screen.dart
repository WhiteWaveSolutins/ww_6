import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:pro_image_editor/models/custom_widgets/utils/custom_widgets_typedef.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/filter_button.dart';
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
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: (Uint8List bytes) async {
            Navigator.pop(context);
          },
        ),
        configs: ProImageEditorConfigs(
          tuneEditorConfigs: const TuneEditorConfigs(enabled: false),
          blurEditorConfigs: const BlurEditorConfigs(enabled: false),
          filterEditorConfigs: const FilterEditorConfigs(),
          customWidgets: ImageEditorCustomWidgets(
            filterEditor: appFilerEditor,
            cropRotateEditor: CustomWidgetsCropRotateEditor(
              appBar: (state, stream) {
                return ReactiveCustomAppbar(
                  builder: (BuildContext context) {
                    return PreferredSize(
                      preferredSize: const Size.fromHeight(150),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Center(
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(.1),
                                ),
                                padding: EdgeInsets.all(16),
                                child: SvgIcon(icon: AppIcons.cut),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  stream: stream,
                );
              },
              bottomBar: (state, stream) {
                return ReactiveCustomWidget(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonCloseFilter(onTap: state.close),
                          ButtonCheckFilter(onTap: state.done),
                        ],
                      ),
                    );
                  },
                  stream: stream,
                );
              },
            ),
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
          gradient: const LinearGradient(
            colors: [
              Color(0xff1a1a1a4d),
              Color(0xff1a1a1a4d),
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
