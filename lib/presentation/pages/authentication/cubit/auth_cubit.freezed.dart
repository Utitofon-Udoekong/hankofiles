// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  UserModel get userModel => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  PasscodeResponse get passcodeResponse => throw _privateConstructorUsedError;
  String get success => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {UserModel userModel,
      String email,
      String code,
      PasscodeResponse passcodeResponse,
      String success,
      String failure,
      bool isLoading});

  $UserModelCopyWith<$Res> get userModel;
  $PasscodeResponseCopyWith<$Res> get passcodeResponse;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? email = null,
    Object? code = null,
    Object? passcodeResponse = null,
    Object? success = null,
    Object? failure = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      passcodeResponse: null == passcodeResponse
          ? _value.passcodeResponse
          : passcodeResponse // ignore: cast_nullable_to_non_nullable
              as PasscodeResponse,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PasscodeResponseCopyWith<$Res> get passcodeResponse {
    return $PasscodeResponseCopyWith<$Res>(_value.passcodeResponse, (value) {
      return _then(_value.copyWith(passcodeResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel userModel,
      String email,
      String code,
      PasscodeResponse passcodeResponse,
      String success,
      String failure,
      bool isLoading});

  @override
  $UserModelCopyWith<$Res> get userModel;
  @override
  $PasscodeResponseCopyWith<$Res> get passcodeResponse;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
    Object? email = null,
    Object? code = null,
    Object? passcodeResponse = null,
    Object? success = null,
    Object? failure = null,
    Object? isLoading = null,
  }) {
    return _then(_$AuthStateImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      passcodeResponse: null == passcodeResponse
          ? _value.passcodeResponse
          : passcodeResponse // ignore: cast_nullable_to_non_nullable
              as PasscodeResponse,
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
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.userModel,
      required this.email,
      required this.code,
      required this.passcodeResponse,
      required this.success,
      required this.failure,
      required this.isLoading});

  @override
  final UserModel userModel;
  @override
  final String email;
  @override
  final String code;
  @override
  final PasscodeResponse passcodeResponse;
  @override
  final String success;
  @override
  final String failure;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AuthState(userModel: $userModel, email: $email, code: $code, passcodeResponse: $passcodeResponse, success: $success, failure: $failure, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.passcodeResponse, passcodeResponse) ||
                other.passcodeResponse == passcodeResponse) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel, email, code,
      passcodeResponse, success, failure, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final UserModel userModel,
      required final String email,
      required final String code,
      required final PasscodeResponse passcodeResponse,
      required final String success,
      required final String failure,
      required final bool isLoading}) = _$AuthStateImpl;

  @override
  UserModel get userModel;
  @override
  String get email;
  @override
  String get code;
  @override
  PasscodeResponse get passcodeResponse;
  @override
  String get success;
  @override
  String get failure;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
