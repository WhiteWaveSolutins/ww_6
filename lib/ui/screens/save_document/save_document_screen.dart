import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/utils.dart';
import 'package:scan_doc/ui/screens/save_document/widgets/documents_columns.dart';
import 'package:scan_doc/ui/screens/save_document/widgets/documents_grid.dart';
import 'package:scan_doc/ui/screens/save_document/widgets/rename_modal.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/buttons/close_button.dart';
import 'package:scan_doc/ui/widgets/buttons/simple_button.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class SaveDocumentScreen extends StatefulWidget {
  final String image;

  const SaveDocumentScreen({
    super.key,
    required this.image,
  });

  @override
  State<SaveDocumentScreen> createState() => _SaveDocumentScreenState();
}

class _SaveDocumentScreenState extends State<SaveDocumentScreen> {
  bool isColumn = true;
  bool isDeleting = false;
  bool isLoading = false;
  late String name;

  List<String> docs = [];
  List<String> deleting = [];

  @override
  void initState() {
    super.initState();
    docs.add(widget.image);
    final store = StoreProvider.of<AppState>(context, listen: false);
    final len = store.state.documentListState.documents.length + 1;
    name = '${convertDate(date: DateTime.now())}. Document $len';
  }

  Future<String?> onScan() async {
    final image = await CunningDocumentScanner.getPictures(
      noOfPages: 1,
      isGalleryImportAllowed: true,
    );
    return image?.firstOrNull;
  }

  void onAdd() async {
    final image = await onScan();
    if (image != null) {
      docs.add(image);
      setState(() {});
    }
  }

  void onReplace(index) async {
    final image = await onScan();
    if (image != null) {
      docs[index] = image;
      setState(() {});
    }
  }

  void onDelete(index) {
    if (docs.length == 1) {
      onClose();
      return;
    }
    docs.removeAt(index);
    setState(() {});
  }

  void onRename() {
    showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: MediaQuery.of(context).size.height - 100,
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => RenameModal(
        name: name,
        onRename: (val) => setState(() => name = val),
      ),
    );
  }

  void onClose() {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Do you really want to get out?'),
        content: const Text('The current file will not be saved'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: Navigator.of(context).pop,
            isDefaultAction: true,
            child: const Text(
              "No",
              style: TextStyle(color: AppColors.blue),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              getItService.navigatorService.onPop();
            },
            isDefaultAction: true,
            child: const Text(
              "Yes",
              style: TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }

  void onSave() async {
    setState(() => isLoading = true);
    final paths = docs.map((e) => e).toList();
    final document = await getItService.documentUseCase.addDocument(
      name: name,
      paths: paths,
    );
    setState(() => isLoading = false);
    if (document != null) {
      Gaimon.success();
      getItService.navigatorService.onPop();
      getItService.navigatorService.onSuccessfullyDocument(document: document);
    } else {
      Gaimon.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: isDeleting
                    ? Opacity(
                        opacity: deleting.isEmpty ? .5 : 1,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (deleting.isEmpty) return;
                            if (deleting.length == docs.length) {
                              onClose();
                              return;
                            }
                            docs.removeWhere((e) => deleting.contains(e));
                            isDeleting = false;
                            setState(() {});
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 3.5),
                            child: SvgIcon(
                              icon: AppIcons.basketFill,
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppCloseButton(
                                padding: 22,
                                onClose: onClose,
                              ),
                              SizedBox(
                                width: 100,
                                child: SimpleButton(
                                  isLoading: isLoading,
                                  title: 'Save',
                                  onPressed: onSave,
                                ),
                              ),
                            ],
                          ),
                          _Type(
                            isColumn: isColumn,
                            onSet: (v) {
                              if (v != isColumn) {
                                Gaimon.selection();
                                isDeleting = false;
                                setState(() => isColumn = v);
                              }
                            },
                          ),
                        ],
                      ),
              ),
              if (isColumn)
                Expanded(
                  child: DocumentsColumns(
                    onRename: onRename,
                    onUpdateState: () => setState(() {}),
                    images: docs,
                    nameDoc: name,
                    onAdd: onAdd,
                    onDelete: onDelete,
                    onReplace: onReplace,
                  ),
                ),
              if (!isColumn)
                Expanded(
                  child: DocumentsGrid(
                    images: docs,
                    deleting: deleting,
                    onAdd: onAdd,
                    isDelete: isDeleting,
                    onSelectDelete: (image) {
                      if (deleting.contains(image)) {
                        deleting.remove(image);
                      } else {
                        deleting.add(image);
                      }
                      setState(() {});
                    },
                    onSwitchDelete: () {
                      deleting = [];
                      setState(() => isDeleting = !isDeleting);
                    },
                    scrollController: ScrollController(),
                    reorder: (list) => setState(() => docs = list),
                  ),
                ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _Type extends StatelessWidget {
  final bool isColumn;
  final Function(bool) onSet;

  const _Type({
    super.key,
    required this.isColumn,
    required this.onSet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => onSet(true),
            child: SvgIcon(
              icon: AppIcons.columns,
              size: 24,
              color: Colors.white.withOpacity(isColumn ? 1 : .3),
            ),
          ),
          const SizedBox(width: 20),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => onSet(false),
            child: SvgIcon(
              icon: AppIcons.grid,
              size: 24,
              color: Colors.white.withOpacity(!isColumn ? 1 : .3),
            ),
          ),
        ],
      ),
    );
  }
}
