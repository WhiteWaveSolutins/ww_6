import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState() = _AppState;
}
