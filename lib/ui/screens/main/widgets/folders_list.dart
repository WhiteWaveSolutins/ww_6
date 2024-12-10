import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/state_manager/document/state.dart';
import 'package:scan_doc/ui/state_manager/folder/state.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

class FoldersList extends StatelessWidget {
  final String search;

  const FoldersList({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FolderListState>(
      converter: (store) => store.state.folderListState,
      builder: (context, state) {
        if (state.folders.isEmpty) return const SizedBox();
        final folders = state.folders.toList();
        if (search.isNotEmpty) {
          folders.removeWhere((e) => !e.name.startsWith(search));
        }
        if (folders.isEmpty) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Folders',
              style: AppText.text2bold.copyWith(
                color: Colors.white.withOpacity(.3),
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 50,
                mainAxisExtent: 120,
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                crossAxisSpacing: 3,
              ),
              itemCount: folders.length,
              itemBuilder: (context, index) => FolderCard(
                folder: folders[index],
              ),
            ),
          ],
        );
      },
    );
  }
}

class FolderCard extends StatelessWidget {
  final Folder folder;

  const FolderCard({
    super.key,
    required this.folder,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (folder.havePassword) {
          getItService.navigatorService.onInfoPassword(
            onOpen: () {
              getItService.navigatorService.onFirst();
              getItService.navigatorService.onFolder(folder: folder);
            },
          );
        } else {
          getItService.navigatorService.onFolder(folder: folder);
        }
      },
      child: Column(
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
          StoreConnector<AppState, DocumentListState>(
            converter: (store) => store.state.documentListState,
            builder: (context, state) {
              final count = state.documents.where((e) => e.folders.contains(folder.id)).toList();
              return Text(
                state.isLoading || state.isError
                    ? ''
                    : count.isEmpty
                        ? '0 docs'
                        : '${count.length} docs',
                style: AppText.small.copyWith(
                  color: Colors.white.withOpacity(.3),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
