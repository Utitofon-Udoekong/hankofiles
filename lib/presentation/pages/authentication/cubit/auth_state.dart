part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required UserModel userModel,
    required String email,
    required String code,
    required PasscodeResponse passcodeResponse,
    required String success,
    required String failure,
    required bool isLoading,
  }) = _AuthState;

  factory AuthState.empty() => AuthState(
      userModel: UserModel.empty(),
      email: "mosesrahul37@gmail.com",
      code: "",
      passcodeResponse: PasscodeResponse.empty(),
      failure: '',
      success: '',
      isLoading: false);
}
