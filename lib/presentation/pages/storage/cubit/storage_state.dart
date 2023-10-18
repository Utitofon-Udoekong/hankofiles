part of 'storage_cubit.dart';

@freezed
class StorageState with _$StorageState {
  const factory StorageState({
    required File selectedFile,
    required FileObject supabaseFile,
    required String searchQuery,
    required String fileName,
    required String success,
    required String failure,
    required bool isLoading,
    required List<FileObject> files,
    required List<FileObject> queryFiles,
    required List<String> filePathsToDelete,
  }) = _StorageState;

  factory StorageState.empty() => StorageState(
        selectedFile: File(""),
        supabaseFile: FileObject(name: "", bucketId: "", owner: "", id: "", updatedAt: "", createdAt: "", lastAccessedAt: "", metadata: {}, buckets: Bucket(id: "", name: "", owner: "", createdAt: "", updatedAt: "", public: false)),
        searchQuery: "",
        fileName: "",
        failure: '',
        success: '',
        isLoading: false, filePathsToDelete: [], files: [], queryFiles: []
      );
}
