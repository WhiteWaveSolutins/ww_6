import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scan_doc/data/models/document.dart';

part 'state.freezed.dart';

@freezed
class DocumentListState with _$DocumentListState {
  factory DocumentListState([
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<Document> documents,
  ]) = _DocumentListState;
}
