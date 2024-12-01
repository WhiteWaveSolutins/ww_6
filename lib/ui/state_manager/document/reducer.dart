import 'package:redux/redux.dart';
import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/document/state.dart';

final documentListReducer = combineReducers<DocumentListState>([
  TypedReducer<DocumentListState, LoadDocumentListAction>(_loadDocumentList).call,
  TypedReducer<DocumentListState, ShowDocumentListAction>(_showDocumentList).call,
  TypedReducer<DocumentListState, ErrorDocumentListAction>(_errorDocumentList).call,
  TypedReducer<DocumentListState, DeleteDocumentListAction>(_deleteDocumentList).call,
]);

// Save code

DocumentListState _loadDocumentList(
  DocumentListState state,
  LoadDocumentListAction action,
) =>
    state.copyWith(
      isLoading: true,
      isError: false,
    );

DocumentListState _showDocumentList(
  DocumentListState state,
  ShowDocumentListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: false,
      documents: action.documents,
    );

DocumentListState _errorDocumentList(
  DocumentListState state,
  ErrorDocumentListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: true,
      errorMessage: action.message,
    );

DocumentListState _deleteDocumentList(
  DocumentListState state,
  DeleteDocumentListAction action,
) {
  final documents = state.documents.toList();
  documents.removeWhere((e) => e.id == action.documentId);
  return state.copyWith(
    isLoading: false,
    isError: false,
    documents: documents,
  );
}
