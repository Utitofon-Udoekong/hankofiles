part of 'storage_cubit.dart';

@freezed
class StorageState with _$StorageState {
  const factory StorageState({
    required File file,
    required String email,
    required String success,
    required String failure,
    required bool isLoading,
  }) = _StorageState;

  factory StorageState.empty() => StorageState(
        file: File("empty"),
        email: "",
        failure: '',
        success: '',
        isLoading: false,
      );
}
