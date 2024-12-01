import 'package:redux/redux.dart';
import 'package:scan_doc/domain/repositories/document_repository.dart';
import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

class DocumentMiddleware implements MiddlewareClass<AppState> {
  final DocumentRepository documentRepository;

  DocumentMiddleware({required this.documentRepository});

  @override
  call(store, action, next) {
    // Documents
    if (action is LoadDocumentListAction) {
      Future(() async {
        final documents = await documentRepository.getListDocument();
        if (documents == null) {
          store.dispatch(ErrorDocumentListAction(message: 'Failed to get documents'));
        } else {
          store.dispatch(ShowDocumentListAction(documents: documents));
        }
      });
    }

    next(action);
  }
}
