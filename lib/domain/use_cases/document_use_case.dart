import 'package:redux/redux.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/domain/repositories/document_repository.dart';
import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/toast/app_toast.dart';

class DocumentUseCase {
  final DocumentRepository documentRepository;
  final Store<AppState> store;

  DocumentUseCase({
    required this.documentRepository,
    required this.store,
  });

  Future<Document?> addDocument({
    required String name,
    required List<String> paths,
  }) async {
    final document = await documentRepository.addDocument(
      name: name,
      paths: paths,
    );
    store.dispatch(LoadDocumentListAction());
    if (document == null) showAppToast('Failed to add document');
    return document;
  }

  Future<bool> editDocument({
    required int id,
    required String name,
    required List<String> paths,
  }) async {
    final document = await documentRepository.editDocument(
      id: id,
      name: name,
      paths: paths,
    );
    store.dispatch(LoadDocumentListAction());
    if (!document) showAppToast('Failed to edit document');
    return document;
  }

  Future<void> deleteDocument({required int documentId}) async {
    store.dispatch(DeleteDocumentListAction(documentId: documentId));
    await documentRepository.deleteDocument(documentId: documentId);
  }

  Future<bool> moveDocument({
    required int documentId,
    required List<int> folderIds,
  }) async {
    final status = await documentRepository.moveDocument(
      documentId: documentId,
      folderIds: folderIds,
    );
    store.dispatch(LoadDocumentListAction());
    if (!status) showAppToast('Failed to move document');
    return status;
  }

  Future<bool> deleteFolderDocument({
    required int documentId,
    required int folderId,
  }) async {
    final status = await documentRepository.deleteFolderDocument(
      documentId: documentId,
      folderId: folderId,
    );
    store.dispatch(LoadDocumentListAction());
    if (!status) showAppToast('Failed to move document');
    return status;
  }
}
