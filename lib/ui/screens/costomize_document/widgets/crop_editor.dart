import 'package:flutter/material.dart';
import 'package:pro_image_editor/models/custom_widgets/custom_widgets.dart';
import 'package:pro_image_editor/widgets/custom_widgets/reactive_custom_widget.dart';
import 'package:scan_doc/ui/screens/costomize_document/costomize_document_screen.dart';

final cropEditor = CustomWidgetsCropRotateEditor(
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
);
