import 'package:scan_doc/data/models/folder.dart';

//Folders
abstract class FolderListAction {}

class LoadFolderListAction extends FolderListAction {}

class ShowFolderListAction extends FolderListAction {
  final List<Folder> folders;

  ShowFolderListAction({required this.folders});
}

class AddFolderListAction extends FolderListAction {
  final Folder folder;

  AddFolderListAction({required this.folder});
}

class ErrorFolderListAction extends FolderListAction {
  final String message;

  ErrorFolderListAction({required this.message});
}
