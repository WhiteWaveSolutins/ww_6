import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/state_manager/folder/state.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/modal/add_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class AddDocumentInFolderModal extends StatefulWidget {
  final Document document;
  final Function(List<int>)? onReturnFolders;

  const AddDocumentInFolderModal({
    super.key,
    required this.document,
    this.onReturnFolders,
  });

  @override
  State<AddDocumentInFolderModal> createState() => _AddDocumentInFolderModalState();
}

class _AddDocumentInFolderModalState extends State<AddDocumentInFolderModal> {
  final List<int> folders = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    folders.addAll(widget.document.folders);
  }

  void move() async {
    setState(() => isLoading = true);
    final isMoved = await getItService.documentUseCase.moveDocument(
      documentId: widget.document.id,
      folderIds: folders,
    );
    setState(() => isLoading = false);
    if (isMoved) {
      widget.onReturnFolders?.call(folders);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your folders',
                    style: AppText.text2bold,
                  ),
                  const SizedBox(height: 24),
                  StoreConnector<AppState, FolderListState>(
                    converter: (store) => store.state.folderListState,
                    builder: (context, state) {
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 50,
                          mainAxisExtent: 120,
                          mainAxisSpacing: 8,
                          crossAxisCount: 3,
                          crossAxisSpacing: 21,
                        ),
                        itemCount: state.folders.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.folders.length) return const _Add();
                          return CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (folders.contains(state.folders[index].id)) {
                                folders.remove(state.folders[index].id);
                              } else {
                                folders.add(state.folders[index].id);
                              }
                              setState(() {});
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                _FolderCard(
                                  folder: state.folders[index],
                                ),
                                if (folders.contains(state.folders[index].id))
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaryGrad1,
                                          AppColors.primaryGrad2,
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 30),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: isLoading ? null : move,
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
                  child: isLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 10,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Add extends StatelessWidget {
  const _Add({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: MediaQuery.of(context).size.height - 100,
          ),
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => const AddFolderModal(),
        );
      },
      child: Column(
        children: [
          const SvgIcon(
            icon: AppIcons.folder,
            size: 70,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 100,
            child: Text(
              'Add new',
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppText.small,
            ),
          ),
        ],
      ),
    );
  }
}

class _FolderCard extends StatelessWidget {
  final Folder folder;

  const _FolderCard({
    super.key,
    required this.folder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          folder.image,
          height: 70,
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 100,
          child: Text(
            folder.name,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppText.small,
          ),
        ),
      ],
    );
  }
}
