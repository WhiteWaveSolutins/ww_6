import 'package:scan_doc/ui/state_manager/document/action.dart';
import 'package:scan_doc/ui/state_manager/document/reducer.dart';
import 'package:scan_doc/ui/state_manager/folder/action.dart';
import 'package:scan_doc/ui/state_manager/folder/reducer.dart';
import 'package:scan_doc/ui/state_manager/store.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is FolderListAction) {
    final nextState = folderListReducer(state.folderListState, action);
    return state.copyWith(folderListState: nextState);
  } else if (action is DocumentListAction) {
    final nextState = documentListReducer(state.documentListState, action);
    return state.copyWith(documentListState: nextState);
  }
  return state;
}
