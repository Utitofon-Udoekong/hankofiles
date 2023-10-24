part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required UserFromEmail userFromEmail,
    required String email,
    required String code,
    required PasscodeResponse passcodeResponse,
    required UserFromSignup userFromSignup,
    required String success,
    required String failure,
    required bool isLoading,
  }) = _AuthState;

  factory AuthState.empty() => AuthState(
      userFromEmail: UserFromEmail.empty(),
      email: "mosesrahul37@gmail.com",
      code: "",
      userFromSignup: UserFromSignup.empty(),
      passcodeResponse: PasscodeResponse.empty(),
      failure: '',
      success: '',
      isLoading: false);
}
