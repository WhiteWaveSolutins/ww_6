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
mixin _$DocumentListState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<Document> get documents => throw _privateConstructorUsedError;

  /// Create a copy of DocumentListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentListStateCopyWith<DocumentListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentListStateCopyWith<$Res> {
  factory $DocumentListStateCopyWith(
          DocumentListState value, $Res Function(DocumentListState) then) =
      _$DocumentListStateCopyWithImpl<$Res, DocumentListState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<Document> documents});
}

/// @nodoc
class _$DocumentListStateCopyWithImpl<$Res, $Val extends DocumentListState>
    implements $DocumentListStateCopyWith<$Res> {
  _$DocumentListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? documents = null,
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
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentListStateImplCopyWith<$Res>
    implements $DocumentListStateCopyWith<$Res> {
  factory _$$DocumentListStateImplCopyWith(_$DocumentListStateImpl value,
          $Res Function(_$DocumentListStateImpl) then) =
      __$$DocumentListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMessage,
      List<Document> documents});
}

/// @nodoc
class __$$DocumentListStateImplCopyWithImpl<$Res>
    extends _$DocumentListStateCopyWithImpl<$Res, _$DocumentListStateImpl>
    implements _$$DocumentListStateImplCopyWith<$Res> {
  __$$DocumentListStateImplCopyWithImpl(_$DocumentListStateImpl _value,
      $Res Function(_$DocumentListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? documents = null,
  }) {
    return _then(_$DocumentListStateImpl(
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
      null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
    ));
  }
}

/// @nodoc

class _$DocumentListStateImpl implements _DocumentListState {
  _$DocumentListStateImpl(
      [this.isLoading = false,
      this.isError = false,
      this.errorMessage = '',
      final List<Document> documents = const []])
      : _documents = documents;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String errorMessage;
  final List<Document> _documents;
  @override
  @JsonKey()
  List<Document> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'DocumentListState(isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, errorMessage,
      const DeepCollectionEquality().hash(_documents));

  /// Create a copy of DocumentListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentListStateImplCopyWith<_$DocumentListStateImpl> get copyWith =>
      __$$DocumentListStateImplCopyWithImpl<_$DocumentListStateImpl>(
          this, _$identity);
}

abstract class _DocumentListState implements DocumentListState {
  factory _DocumentListState(
      [final bool isLoading,
      final bool isError,
      final String errorMessage,
      final List<Document> documents]) = _$DocumentListStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorMessage;
  @override
  List<Document> get documents;

  /// Create a copy of DocumentListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentListStateImplCopyWith<_$DocumentListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
