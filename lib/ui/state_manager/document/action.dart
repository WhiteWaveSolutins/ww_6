import 'package:scan_doc/data/models/document.dart';

//Documents
abstract class DocumentListAction {}

class LoadDocumentListAction extends DocumentListAction {}

class ShowDocumentListAction extends DocumentListAction {
  final List<Document> documents;

  ShowDocumentListAction({required this.documents});
}

class DeleteDocumentListAction extends DocumentListAction {
  final int documentId;

  DeleteDocumentListAction({required this.documentId});
}

class ErrorDocumentListAction extends DocumentListAction {
  final String message;

  ErrorDocumentListAction({required this.message});
}
