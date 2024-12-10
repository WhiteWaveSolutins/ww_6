import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/main/widgets/documents_list.dart';
import 'package:scan_doc/ui/widgets/buttons/close_button.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/modal/add_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class FolderScreen extends StatefulWidget {
  final Folder folder;

  const FolderScreen({
    super.key,
    required this.folder,
  });

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  late Folder folder;

  @override
  void initState() {
    super.initState();
    folder = widget.folder;
  }

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const AppCloseButton(
                  padding: 22,
                  margin: false,
                ),
                const Spacer(),
                CupertinoButton(
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
                      builder: (context) => AddFolderModal(
                        folder: folder,
                        setFolder: (n) => setState(() => folder = n),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.white.withOpacity(.1),
                    ),
                    child: const SvgIcon(icon: AppIcons.edit),
                  ),
                ),
                const SizedBox(width: 8),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showDialog(
                      context: context,
                      useRootNavigator: true,
                      builder: (_) => CupertinoAlertDialog(
                        title: const Text('Do you really want to delete this folder?'),
                        content: const Text('Her files will also be deleted'),
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
                              getItService.folderUseCase.deleteFolder(folderId: widget.folder.id);
                              Navigator.of(context).pop();
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
                  },
                  child: const SvgIcon(
                    icon: AppIcons.basketFill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              folder.name,
              style: AppText.prompt.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            DocumentsList(folder: widget.folder),
          ],
        ),
      ),
    );
  }
}
