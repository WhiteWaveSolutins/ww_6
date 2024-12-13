import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gaimon/gaimon.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/state_manager/document/state.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/modal/add_document_in_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:share_plus/share_plus.dart';

class DocumentsList extends StatelessWidget {
  final Folder? folder;
  final bool sortByDate;
  final String search;

  const DocumentsList({
    super.key,
    this.folder,
    this.sortByDate = true,
    this.search = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (folder == null)
          Text(
            'Other documents',
            style: AppText.text2bold.copyWith(
              color: Colors.white.withOpacity(.3),
            ),
          ),
        StoreConnector<AppState, DocumentListState>(
          converter: (store) => store.state.documentListState,
          builder: (context, state) {
            if (state.isLoading) {
              return const _State(
                isLoading: true,
                isSearch: false,
              );
            }
            if (state.isError) return Text(state.errorMessage);
            final documents = state.documents.where((e) {
              if (folder == null) return e.folders.isEmpty;
              return e.folders.contains(folder!.id);
            }).toList();

            if (search.isNotEmpty) {
              documents.removeWhere((e) => !e.name.startsWith(search));
            }

            if (sortByDate) {
              documents.sort((a, b) => a.created.compareTo(b.created));
            } else {
              documents.sort((a, b) => a.name.compareTo(b.name));
            }

            if (documents.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (folder != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      '0 docs',
                      style: AppText.text16.copyWith(
                        color: Colors.white.withOpacity(.3),
                      ),
                    ),
                  ],
                  _State(
                    isLoading: false,
                    isSearch: search.isNotEmpty,
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (folder != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${documents.length} docs',
                    style: AppText.text16.copyWith(
                      color: Colors.white.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
                const SizedBox(height: 8),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 50,
                    mainAxisExtent: 125,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    crossAxisSpacing: 21,
                  ),
                  itemCount: documents.length,
                  itemBuilder: (context, index) => DocumentCard(
                    document: documents[index],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class DocumentCard extends StatelessWidget {
  final Document document;

  const DocumentCard({
    super.key,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => getItService.navigatorService.onDocument(
        document: document,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 86,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.memory(
                      File(document.paths.first).readAsBytesSync(),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  document.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.small,
                ),
                Text(
                  '${document.paths.length} pg',
                  textAlign: TextAlign.center,
                  style: AppText.small.copyWith(
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
              ],
            ),
          ),
          _More(document: document),
        ],
      ),
    );
  }
}

class _More extends StatelessWidget {
  final Document document;

  const _More({
    super.key,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      itemBuilder: (context) => [
        PullDownMenuItem(
          title: 'Export',
          itemTheme: PullDownMenuItemTheme(
            textStyle: AppText.text16.copyWith(
              color: AppColors.black,
            ),
          ),
          onTap: () {
            Gaimon.selection();
            Share.shareXFiles(
              document.paths.map((e) => XFile(e)).toList(),
            );
          },
        ),
        PullDownMenuItem(
          title: 'Move',
          itemTheme: PullDownMenuItemTheme(
            textStyle: AppText.text16.copyWith(
              color: AppColors.black,
            ),
          ),
          onTap: () {
            Gaimon.selection();
            showModalBottomSheet(
              isScrollControlled: true,
              constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height - 100,
              ),
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => AddDocumentInFolderModal(document: document),
            );
          },
        ),
        PullDownMenuItem(
          title: 'Delete',
          itemTheme: PullDownMenuItemTheme(
            textStyle: AppText.text16.copyWith(
              color: AppColors.red,
            ),
          ),
          onTap: () {
            Gaimon.selection();
            getItService.documentUseCase.deleteDocument(documentId: document.id);
          },
        ),
      ],
      buttonBuilder: (context, showMenu) => GestureDetector(
        onTap: showMenu,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white.withOpacity(.3),
          ),
          child: const Center(
            child: Icon(
              Icons.more_horiz_outlined,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _State extends StatelessWidget {
  final bool isLoading;
  final bool isSearch;

  const _State({
    super.key,
    required this.isLoading,
    required this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        if (isLoading)
          const Center(
            child: CupertinoActivityIndicator(color: Colors.white),
          )
        else
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SvgIcon(
                    icon: isSearch ? AppIcons.noSearch : AppIcons.file,
                    size: 25,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isSearch ? 'Nothing found' : 'There are no documents here yet',
                    style: AppText.small.copyWith(
                      color: Colors.white.withOpacity(.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 180),
      ],
    );
  }
}
