import 'package:flutter/material.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/main/main_screen.dart';
import 'package:scan_doc/ui/screens/main/widgets/documents_list.dart';
import 'package:scan_doc/ui/widgets/fields/search_field.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';

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
  bool byDate = true;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.folder.name,
            style: AppText.h2,
          ),
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
            DocumentsList(folder: widget.folder),
          ],
        ),
      ),
    );
  }
}
