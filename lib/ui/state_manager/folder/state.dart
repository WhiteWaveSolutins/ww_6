import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scan_doc/data/models/folder.dart';

part 'state.freezed.dart';

@freezed
class FolderListState with _$FolderListState {
  factory FolderListState([
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<Folder> folders,
  ]) = _FolderListState;
}
