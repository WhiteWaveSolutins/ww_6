import 'package:redux/redux.dart';
import 'package:scan_doc/ui/state_manager/folder/action.dart';
import 'package:scan_doc/ui/state_manager/folder/state.dart';

final folderListReducer = combineReducers<FolderListState>([
  TypedReducer<FolderListState, LoadFolderListAction>(_loadFolderList).call,
  TypedReducer<FolderListState, ShowFolderListAction>(_showFolderList).call,
  TypedReducer<FolderListState, ErrorFolderListAction>(_errorFolderList).call,
  TypedReducer<FolderListState, AddFolderListAction>(_addFolderList).call,
]);

// Save code

FolderListState _loadFolderList(
  FolderListState state,
  LoadFolderListAction action,
) =>
    state.copyWith(
      isLoading: true,
      isError: false,
    );

FolderListState _addFolderList(
  FolderListState state,
  AddFolderListAction action,
) {
  final folders = state.folders.toList();
  folders.add(action.folder);
  return state.copyWith(
    isLoading: false,
    isError: false,
    folders: folders,
  );
}

FolderListState _showFolderList(
  FolderListState state,
  ShowFolderListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: false,
      folders: action.folders,
    );

FolderListState _errorFolderList(
  FolderListState state,
  ErrorFolderListAction action,
) =>
    state.copyWith(
      isLoading: false,
      isError: true,
      errorMessage: action.message,
    );
