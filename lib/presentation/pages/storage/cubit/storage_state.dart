part of 'storage_cubit.dart';

@freezed
class StorageState with _$StorageState {
  const factory StorageState({
    required File selectedFile,
    required FileObject supabaseFile,
    required String email,
    required String success,
    required String failure,
    required bool isLoading,
    required List<FileObject> files,
    required List<String> filePathsToDelete,
  }) = _StorageState;

  factory StorageState.empty() => StorageState(
        selectedFile: File("empty"),
        supabaseFile: FileObject.fromJson({}),
        email: "",
        failure: '',
        success: '',
        isLoading: false, filePathsToDelete: [], files: [],
      );
}
