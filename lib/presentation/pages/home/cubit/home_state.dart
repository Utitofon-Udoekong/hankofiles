part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String folderName,
    required File file,
    required Color color,
    required String success,
    required String failure,
    required bool isLoading,
  }) = _HomeState;
  factory HomeState.empty() => HomeState(folderName: "", file: File(""), color: Colors.black, success: "", failure: "", isLoading: false);
}
