// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  FolderListState get folderListState => throw _privateConstructorUsedError;
  DocumentListState get documentListState => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {FolderListState folderListState, DocumentListState documentListState});

  $FolderListStateCopyWith<$Res> get folderListState;
  $DocumentListStateCopyWith<$Res> get documentListState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderListState = null,
    Object? documentListState = null,
  }) {
    return _then(_value.copyWith(
      folderListState: null == folderListState
          ? _value.folderListState
          : folderListState // ignore: cast_nullable_to_non_nullable
              as FolderListState,
      documentListState: null == documentListState
          ? _value.documentListState
          : documentListState // ignore: cast_nullable_to_non_nullable
              as DocumentListState,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FolderListStateCopyWith<$Res> get folderListState {
    return $FolderListStateCopyWith<$Res>(_value.folderListState, (value) {
      return _then(_value.copyWith(folderListState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentListStateCopyWith<$Res> get documentListState {
    return $DocumentListStateCopyWith<$Res>(_value.documentListState, (value) {
      return _then(_value.copyWith(documentListState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FolderListState folderListState, DocumentListState documentListState});

  @override
  $FolderListStateCopyWith<$Res> get folderListState;
  @override
  $DocumentListStateCopyWith<$Res> get documentListState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderListState = null,
    Object? documentListState = null,
  }) {
    return _then(_$AppStateImpl(
      folderListState: null == folderListState
          ? _value.folderListState
          : folderListState // ignore: cast_nullable_to_non_nullable
              as FolderListState,
      documentListState: null == documentListState
          ? _value.documentListState
          : documentListState // ignore: cast_nullable_to_non_nullable
              as DocumentListState,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {required this.folderListState, required this.documentListState});

  @override
  final FolderListState folderListState;
  @override
  final DocumentListState documentListState;

  @override
  String toString() {
    return 'AppState(folderListState: $folderListState, documentListState: $documentListState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.folderListState, folderListState) ||
                other.folderListState == folderListState) &&
            (identical(other.documentListState, documentListState) ||
                other.documentListState == documentListState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, folderListState, documentListState);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final FolderListState folderListState,
      required final DocumentListState documentListState}) = _$AppStateImpl;

  @override
  FolderListState get folderListState;
  @override
  DocumentListState get documentListState;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
