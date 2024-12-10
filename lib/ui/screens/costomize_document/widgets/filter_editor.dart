import 'package:pro_image_editor/models/custom_widgets/custom_widgets_filter_editor.dart';
import 'package:scan_doc/ui/screens/costomize_document/widgets/filter_button.dart';

final appFilerEditor = CustomWidgetsFilterEditor(
  //appBar: (state, stream) {
  //  return ReactiveCustomAppbar(
  //    builder: (BuildContext context) {
  //      return PreferredSize(
  //        preferredSize: const Size.fromHeight(100),
  //        child: Container(
  //          color: Colors.orange,
  //          height: 100,
  //          child: GestureDetector(
  //            onTap: state.close,
  //            child: const Icon(Icons.architecture),
  //          ),
  //        ),
  //      );
  //    },
  //    stream: stream,
  //  );
  //},
  filterButton: (mode, __, ___, func, widget, _) {
    return FilterButton(
      onTap: func,
      name: mode.name,
      child: widget,
    );
  },
);
