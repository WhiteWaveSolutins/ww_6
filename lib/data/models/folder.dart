import 'package:scan_doc/data/database/database.dart';

class Folder {
  final int id;
  final String name;
  final int imageIndex;
  late bool havePassword;

  Folder({
    required this.id,
    required this.name,
    required this.imageIndex,
    required this.havePassword,
  });

  factory Folder.fromTableData(FolderTableData data) => Folder(
        id: data.id,
        name: data.name,
        imageIndex: data.image,
        havePassword: data.havePassword,
      );

  String get image => 'assets/images/folders/folder$imageIndex.png';
}
