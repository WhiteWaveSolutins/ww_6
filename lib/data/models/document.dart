import 'package:scan_doc/data/database/database.dart';

class Document {
  final int id;
  final String name;
  final List<String> paths;
  final List<int> folders;

  Document({
    required this.id,
    required this.name,
    required this.paths,
    required this.folders,
  });

  factory Document.fromTableData({
    required DocumentTableData data,
    required List<DocumentPathTableData> paths,
    required List<FolderDocumentTableData> folders,
  }) =>
      Document(
        id: data.id,
        name: data.name,
        folders: folders.map((e) => e.folderId).toList(),
        paths: paths.map((e) => e.path).toList(),
      );
}
