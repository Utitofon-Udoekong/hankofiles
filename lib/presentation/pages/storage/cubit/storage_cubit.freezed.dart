// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StorageState {
  File get selectedFile => throw _privateConstructorUsedError;
  FileObject get supabaseFile => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get success => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<FileObject> get files => throw _privateConstructorUsedError;
  List<String> get filePathsToDelete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StorageStateCopyWith<StorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageStateCopyWith<$Res> {
  factory $StorageStateCopyWith(
          StorageState value, $Res Function(StorageState) then) =
      _$StorageStateCopyWithImpl<$Res, StorageState>;
  @useResult
  $Res call(
      {File selectedFile,
      FileObject supabaseFile,
      String email,
      String success,
      String failure,
      bool isLoading,
      List<FileObject> files,
      List<String> filePathsToDelete});
}

/// @nodoc
class _$StorageStateCopyWithImpl<$Res, $Val extends StorageState>
    implements $StorageStateCopyWith<$Res> {
  _$StorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFile = null,
    Object? supabaseFile = null,
    Object? email = null,
    Object? success = null,
    Object? failure = null,
    Object? isLoading = null,
    Object? files = null,
    Object? filePathsToDelete = null,
  }) {
    return _then(_value.copyWith(
      selectedFile: null == selectedFile
          ? _value.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File,
      supabaseFile: null == supabaseFile
          ? _value.supabaseFile
          : supabaseFile // ignore: cast_nullable_to_non_nullable
              as FileObject,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileObject>,
      filePathsToDelete: null == filePathsToDelete
          ? _value.filePathsToDelete
          : filePathsToDelete // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageStateImplCopyWith<$Res>
    implements $StorageStateCopyWith<$Res> {
  factory _$$StorageStateImplCopyWith(
          _$StorageStateImpl value, $Res Function(_$StorageStateImpl) then) =
      __$$StorageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {File selectedFile,
      FileObject supabaseFile,
      String email,
      String success,
      String failure,
      bool isLoading,
      List<FileObject> files,
      List<String> filePathsToDelete});
}

/// @nodoc
class __$$StorageStateImplCopyWithImpl<$Res>
    extends _$StorageStateCopyWithImpl<$Res, _$StorageStateImpl>
    implements _$$StorageStateImplCopyWith<$Res> {
  __$$StorageStateImplCopyWithImpl(
      _$StorageStateImpl _value, $Res Function(_$StorageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFile = null,
    Object? supabaseFile = null,
    Object? email = null,
    Object? success = null,
    Object? failure = null,
    Object? isLoading = null,
    Object? files = null,
    Object? filePathsToDelete = null,
  }) {
    return _then(_$StorageStateImpl(
      selectedFile: null == selectedFile
          ? _value.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File,
      supabaseFile: null == supabaseFile
          ? _value.supabaseFile
          : supabaseFile // ignore: cast_nullable_to_non_nullable
              as FileObject,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileObject>,
      filePathsToDelete: null == filePathsToDelete
          ? _value._filePathsToDelete
          : filePathsToDelete // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$StorageStateImpl implements _StorageState {
  const _$StorageStateImpl(
      {required this.selectedFile,
      required this.supabaseFile,
      required this.email,
      required this.success,
      required this.failure,
      required this.isLoading,
      required final List<FileObject> files,
      required final List<String> filePathsToDelete})
      : _files = files,
        _filePathsToDelete = filePathsToDelete;

  @override
  final File selectedFile;
  @override
  final FileObject supabaseFile;
  @override
  final String email;
  @override
  final String success;
  @override
  final String failure;
  @override
  final bool isLoading;
  final List<FileObject> _files;
  @override
  List<FileObject> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  final List<String> _filePathsToDelete;
  @override
  List<String> get filePathsToDelete {
    if (_filePathsToDelete is EqualUnmodifiableListView)
      return _filePathsToDelete;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filePathsToDelete);
  }

  @override
  String toString() {
    return 'StorageState(selectedFile: $selectedFile, supabaseFile: $supabaseFile, email: $email, success: $success, failure: $failure, isLoading: $isLoading, files: $files, filePathsToDelete: $filePathsToDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageStateImpl &&
            (identical(other.selectedFile, selectedFile) ||
                other.selectedFile == selectedFile) &&
            (identical(other.supabaseFile, supabaseFile) ||
                other.supabaseFile == supabaseFile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality()
                .equals(other._filePathsToDelete, _filePathsToDelete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedFile,
      supabaseFile,
      email,
      success,
      failure,
      isLoading,
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(_filePathsToDelete));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageStateImplCopyWith<_$StorageStateImpl> get copyWith =>
      __$$StorageStateImplCopyWithImpl<_$StorageStateImpl>(this, _$identity);
}

abstract class _StorageState implements StorageState {
  const factory _StorageState(
      {required final File selectedFile,
      required final FileObject supabaseFile,
      required final String email,
      required final String success,
      required final String failure,
      required final bool isLoading,
      required final List<FileObject> files,
      required final List<String> filePathsToDelete}) = _$StorageStateImpl;

  @override
  File get selectedFile;
  @override
  FileObject get supabaseFile;
  @override
  String get email;
  @override
  String get success;
  @override
  String get failure;
  @override
  bool get isLoading;
  @override
  List<FileObject> get files;
  @override
  List<String> get filePathsToDelete;
  @override
  @JsonKey(ignore: true)
  _$$StorageStateImplCopyWith<_$StorageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
