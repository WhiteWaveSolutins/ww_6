import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:redux/redux.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/main/widgets/documents_list.dart';
import 'package:scan_doc/ui/screens/main/widgets/folders_list.dart';
import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/folder/action.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/fields/search_field.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/modal/add_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:gaimon/gaimon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Store<AppState> _store;
  bool byDate = true;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _store = StoreProvider.of<AppState>(context, listen: false);
    if (_store.state.folderListState.folders.isEmpty) {
      _store.dispatch(LoadFolderListAction());
    }
    if (_store.state.documentListState.documents.isEmpty) {
      _store.dispatch(LoadDocumentListAction());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Documents',
            style: AppText.h2,
          ),
          actions: [
            IconButton(
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
              icon: const SvgIcon(
                icon: AppIcons.folder,
                size: 26,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            SearchField(
              onChanged: () => setState(() {}),
              controller: searchController,
            ),
            const SizedBox(height: 16),
            SortDocument(
              byDate: byDate,
              selected: (v) => setState(() => byDate = v),
            ),
            FoldersList(search: searchController.text),
            const DocumentsList(),
          ],
        ),
      ),
    );
  }
}

class SortDocument extends StatelessWidget {
  final bool byDate;
  final Function(bool) selected;

  const SortDocument({
    super.key,
    required this.byDate,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PullDownButton(
          itemBuilder: (context) => [
            PullDownMenuItem(
              title: 'By date',
              itemTheme: PullDownMenuItemTheme(
                textStyle: AppText.text16.copyWith(
                  color: AppColors.black,
                ),
              ),
              onTap: () {
                if (byDate) return;
                Gaimon.selection();
                selected(true);
              },
            ),
            PullDownMenuItem(
              title: 'By name',
              itemTheme: PullDownMenuItemTheme(
                textStyle: AppText.text16.copyWith(
                  color: AppColors.black,
                ),
              ),
              onTap: () {
                if (!byDate) return;
                Gaimon.selection();
                selected(false);
              },
            ),
          ],
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SvgIcon(
                  icon: AppIcons.sort,
                  size: 15,
                ),
                const SizedBox(width: 8),
                Text(
                  byDate ? 'By date' : 'By name',
                  style: AppText.text2bold,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
