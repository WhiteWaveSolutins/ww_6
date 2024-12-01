// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FolderListState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<Folder> get folders => throw _privateConstructorUsedError;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderListStateCopyWith<FolderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderListStateCopyWith<$Res> {
  factory $FolderListStateCopyWith(
          FolderListState value, $Res Function(FolderListState) then) =
      _$FolderListStateCopyWithImpl<$Res, FolderListState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<Folder> folders});
}

/// @nodoc
class _$FolderListStateCopyWithImpl<$Res, $Val extends FolderListState>
    implements $FolderListStateCopyWith<$Res> {
  _$FolderListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? folders = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      folders: null == folders
          ? _value.folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderListStateImplCopyWith<$Res>
    implements $FolderListStateCopyWith<$Res> {
  factory _$$FolderListStateImplCopyWith(_$FolderListStateImpl value,
          $Res Function(_$FolderListStateImpl) then) =
      __$$FolderListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<Folder> folders});
}

/// @nodoc
class __$$FolderListStateImplCopyWithImpl<$Res>
    extends _$FolderListStateCopyWithImpl<$Res, _$FolderListStateImpl>
    implements _$$FolderListStateImplCopyWith<$Res> {
  __$$FolderListStateImplCopyWithImpl(
      _$FolderListStateImpl _value, $Res Function(_$FolderListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? folders = null,
  }) {
    return _then(_$FolderListStateImpl(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      null == folders
          ? _value._folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
    ));
  }
}

/// @nodoc

class _$FolderListStateImpl implements _FolderListState {
  _$FolderListStateImpl(
      [this.isLoading = false,
      this.isError = false,
      this.errorMessage = '',
      final List<Folder> folders = const []])
      : _folders = folders;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String errorMessage;
  final List<Folder> _folders;
  @override
  @JsonKey()
  List<Folder> get folders {
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folders);
  }

  @override
  String toString() {
    return 'FolderListState(isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, folders: $folders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._folders, _folders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, errorMessage,
      const DeepCollectionEquality().hash(_folders));

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderListStateImplCopyWith<_$FolderListStateImpl> get copyWith =>
      __$$FolderListStateImplCopyWithImpl<_$FolderListStateImpl>(
          this, _$identity);
}

abstract class _FolderListState implements FolderListState {
  factory _FolderListState(
      [final bool isLoading,
      final bool isError,
      final String errorMessage,
      final List<Folder> folders]) = _$FolderListStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorMessage;
  @override
  List<Folder> get folders;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderListStateImplCopyWith<_$FolderListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
