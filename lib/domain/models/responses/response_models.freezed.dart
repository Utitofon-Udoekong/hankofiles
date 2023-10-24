// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasscodeResponse _$PasscodeResponseFromJson(Map<String, dynamic> json) {
  return _PasscodeResponse.fromJson(json);
}

/// @nodoc
mixin _$PasscodeResponse {
  @JsonKey(fromJson: getDateTimeFromISO8601String)
  DateTime get created_at => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get ttl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasscodeResponseCopyWith<PasscodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasscodeResponseCopyWith<$Res> {
  factory $PasscodeResponseCopyWith(
          PasscodeResponse value, $Res Function(PasscodeResponse) then) =
      _$PasscodeResponseCopyWithImpl<$Res, PasscodeResponse>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: getDateTimeFromISO8601String) DateTime created_at,
      String id,
      int ttl});
}

/// @nodoc
class _$PasscodeResponseCopyWithImpl<$Res, $Val extends PasscodeResponse>
    implements $PasscodeResponseCopyWith<$Res> {
  _$PasscodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created_at = null,
    Object? id = null,
    Object? ttl = null,
  }) {
    return _then(_value.copyWith(
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasscodeResponseImplCopyWith<$Res>
    implements $PasscodeResponseCopyWith<$Res> {
  factory _$$PasscodeResponseImplCopyWith(_$PasscodeResponseImpl value,
          $Res Function(_$PasscodeResponseImpl) then) =
      __$$PasscodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: getDateTimeFromISO8601String) DateTime created_at,
      String id,
      int ttl});
}

/// @nodoc
class __$$PasscodeResponseImplCopyWithImpl<$Res>
    extends _$PasscodeResponseCopyWithImpl<$Res, _$PasscodeResponseImpl>
    implements _$$PasscodeResponseImplCopyWith<$Res> {
  __$$PasscodeResponseImplCopyWithImpl(_$PasscodeResponseImpl _value,
      $Res Function(_$PasscodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created_at = null,
    Object? id = null,
    Object? ttl = null,
  }) {
    return _then(_$PasscodeResponseImpl(
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasscodeResponseImpl implements _PasscodeResponse {
  const _$PasscodeResponseImpl(
      {@JsonKey(fromJson: getDateTimeFromISO8601String)
      required this.created_at,
      required this.id,
      required this.ttl});

  factory _$PasscodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasscodeResponseImplFromJson(json);

  @override
  @JsonKey(fromJson: getDateTimeFromISO8601String)
  final DateTime created_at;
  @override
  final String id;
  @override
  final int ttl;

  @override
  String toString() {
    return 'PasscodeResponse(created_at: $created_at, id: $id, ttl: $ttl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeResponseImpl &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ttl, ttl) || other.ttl == ttl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, created_at, id, ttl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasscodeResponseImplCopyWith<_$PasscodeResponseImpl> get copyWith =>
      __$$PasscodeResponseImplCopyWithImpl<_$PasscodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasscodeResponseImplToJson(
      this,
    );
  }
}

abstract class _PasscodeResponse implements PasscodeResponse {
  const factory _PasscodeResponse(
      {@JsonKey(fromJson: getDateTimeFromISO8601String)
      required final DateTime created_at,
      required final String id,
      required final int ttl}) = _$PasscodeResponseImpl;

  factory _PasscodeResponse.fromJson(Map<String, dynamic> json) =
      _$PasscodeResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: getDateTimeFromISO8601String)
  DateTime get created_at;
  @override
  String get id;
  @override
  int get ttl;
  @override
  @JsonKey(ignore: true)
  _$$PasscodeResponseImplCopyWith<_$PasscodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserFromEmail _$UserFromEmailFromJson(Map<String, dynamic> json) {
  return _UserFromEmail.fromJson(json);
}

/// @nodoc
mixin _$UserFromEmail {
  String get email_id => throw _privateConstructorUsedError;
  bool get has_webauthn_credential => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFromEmailCopyWith<UserFromEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFromEmailCopyWith<$Res> {
  factory $UserFromEmailCopyWith(
          UserFromEmail value, $Res Function(UserFromEmail) then) =
      _$UserFromEmailCopyWithImpl<$Res, UserFromEmail>;
  @useResult
  $Res call(
      {String email_id,
      bool has_webauthn_credential,
      String id,
      bool verified});
}

/// @nodoc
class _$UserFromEmailCopyWithImpl<$Res, $Val extends UserFromEmail>
    implements $UserFromEmailCopyWith<$Res> {
  _$UserFromEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_id = null,
    Object? has_webauthn_credential = null,
    Object? id = null,
    Object? verified = null,
  }) {
    return _then(_value.copyWith(
      email_id: null == email_id
          ? _value.email_id
          : email_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_webauthn_credential: null == has_webauthn_credential
          ? _value.has_webauthn_credential
          : has_webauthn_credential // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFromEmailImplCopyWith<$Res>
    implements $UserFromEmailCopyWith<$Res> {
  factory _$$UserFromEmailImplCopyWith(
          _$UserFromEmailImpl value, $Res Function(_$UserFromEmailImpl) then) =
      __$$UserFromEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email_id,
      bool has_webauthn_credential,
      String id,
      bool verified});
}

/// @nodoc
class __$$UserFromEmailImplCopyWithImpl<$Res>
    extends _$UserFromEmailCopyWithImpl<$Res, _$UserFromEmailImpl>
    implements _$$UserFromEmailImplCopyWith<$Res> {
  __$$UserFromEmailImplCopyWithImpl(
      _$UserFromEmailImpl _value, $Res Function(_$UserFromEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_id = null,
    Object? has_webauthn_credential = null,
    Object? id = null,
    Object? verified = null,
  }) {
    return _then(_$UserFromEmailImpl(
      email_id: null == email_id
          ? _value.email_id
          : email_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_webauthn_credential: null == has_webauthn_credential
          ? _value.has_webauthn_credential
          : has_webauthn_credential // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFromEmailImpl implements _UserFromEmail {
  const _$UserFromEmailImpl(
      {required this.email_id,
      required this.has_webauthn_credential,
      required this.id,
      required this.verified});

  factory _$UserFromEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFromEmailImplFromJson(json);

  @override
  final String email_id;
  @override
  final bool has_webauthn_credential;
  @override
  final String id;
  @override
  final bool verified;

  @override
  String toString() {
    return 'UserFromEmail(email_id: $email_id, has_webauthn_credential: $has_webauthn_credential, id: $id, verified: $verified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFromEmailImpl &&
            (identical(other.email_id, email_id) ||
                other.email_id == email_id) &&
            (identical(
                    other.has_webauthn_credential, has_webauthn_credential) ||
                other.has_webauthn_credential == has_webauthn_credential) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email_id, has_webauthn_credential, id, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFromEmailImplCopyWith<_$UserFromEmailImpl> get copyWith =>
      __$$UserFromEmailImplCopyWithImpl<_$UserFromEmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFromEmailImplToJson(
      this,
    );
  }
}

abstract class _UserFromEmail implements UserFromEmail {
  const factory _UserFromEmail(
      {required final String email_id,
      required final bool has_webauthn_credential,
      required final String id,
      required final bool verified}) = _$UserFromEmailImpl;

  factory _UserFromEmail.fromJson(Map<String, dynamic> json) =
      _$UserFromEmailImpl.fromJson;

  @override
  String get email_id;
  @override
  bool get has_webauthn_credential;
  @override
  String get id;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$UserFromEmailImplCopyWith<_$UserFromEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserFromSignup _$UserFromSignupFromJson(Map<String, dynamic> json) {
  return _UserFromSignup.fromJson(json);
}

/// @nodoc
mixin _$UserFromSignup {
  String get email_id => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFromSignupCopyWith<UserFromSignup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFromSignupCopyWith<$Res> {
  factory $UserFromSignupCopyWith(
          UserFromSignup value, $Res Function(UserFromSignup) then) =
      _$UserFromSignupCopyWithImpl<$Res, UserFromSignup>;
  @useResult
  $Res call({String email_id, String id, String user_id});
}

/// @nodoc
class _$UserFromSignupCopyWithImpl<$Res, $Val extends UserFromSignup>
    implements $UserFromSignupCopyWith<$Res> {
  _$UserFromSignupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_id = null,
    Object? id = null,
    Object? user_id = null,
  }) {
    return _then(_value.copyWith(
      email_id: null == email_id
          ? _value.email_id
          : email_id // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFromSignupImplCopyWith<$Res>
    implements $UserFromSignupCopyWith<$Res> {
  factory _$$UserFromSignupImplCopyWith(_$UserFromSignupImpl value,
          $Res Function(_$UserFromSignupImpl) then) =
      __$$UserFromSignupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email_id, String id, String user_id});
}

/// @nodoc
class __$$UserFromSignupImplCopyWithImpl<$Res>
    extends _$UserFromSignupCopyWithImpl<$Res, _$UserFromSignupImpl>
    implements _$$UserFromSignupImplCopyWith<$Res> {
  __$$UserFromSignupImplCopyWithImpl(
      _$UserFromSignupImpl _value, $Res Function(_$UserFromSignupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email_id = null,
    Object? id = null,
    Object? user_id = null,
  }) {
    return _then(_$UserFromSignupImpl(
      email_id: null == email_id
          ? _value.email_id
          : email_id // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFromSignupImpl implements _UserFromSignup {
  const _$UserFromSignupImpl(
      {required this.email_id, required this.id, required this.user_id});

  factory _$UserFromSignupImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFromSignupImplFromJson(json);

  @override
  final String email_id;
  @override
  final String id;
  @override
  final String user_id;

  @override
  String toString() {
    return 'UserFromSignup(email_id: $email_id, id: $id, user_id: $user_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFromSignupImpl &&
            (identical(other.email_id, email_id) ||
                other.email_id == email_id) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email_id, id, user_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFromSignupImplCopyWith<_$UserFromSignupImpl> get copyWith =>
      __$$UserFromSignupImplCopyWithImpl<_$UserFromSignupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFromSignupImplToJson(
      this,
    );
  }
}

abstract class _UserFromSignup implements UserFromSignup {
  const factory _UserFromSignup(
      {required final String email_id,
      required final String id,
      required final String user_id}) = _$UserFromSignupImpl;

  factory _UserFromSignup.fromJson(Map<String, dynamic> json) =
      _$UserFromSignupImpl.fromJson;

  @override
  String get email_id;
  @override
  String get id;
  @override
  String get user_id;
  @override
  @JsonKey(ignore: true)
  _$$UserFromSignupImplCopyWith<_$UserFromSignupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSignupDTO _$UserSignupDTOFromJson(Map<String, dynamic> json) {
  return _UserSignupDTO.fromJson(json);
}

/// @nodoc
mixin _$UserSignupDTO {
  UserFromSignup get userFromSignup => throw _privateConstructorUsedError;
  PasscodeResponse get passcodeResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSignupDTOCopyWith<UserSignupDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignupDTOCopyWith<$Res> {
  factory $UserSignupDTOCopyWith(
          UserSignupDTO value, $Res Function(UserSignupDTO) then) =
      _$UserSignupDTOCopyWithImpl<$Res, UserSignupDTO>;
  @useResult
  $Res call({UserFromSignup userFromSignup, PasscodeResponse passcodeResponse});

  $UserFromSignupCopyWith<$Res> get userFromSignup;
  $PasscodeResponseCopyWith<$Res> get passcodeResponse;
}

/// @nodoc
class _$UserSignupDTOCopyWithImpl<$Res, $Val extends UserSignupDTO>
    implements $UserSignupDTOCopyWith<$Res> {
  _$UserSignupDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFromSignup = null,
    Object? passcodeResponse = null,
  }) {
    return _then(_value.copyWith(
      userFromSignup: null == userFromSignup
          ? _value.userFromSignup
          : userFromSignup // ignore: cast_nullable_to_non_nullable
              as UserFromSignup,
      passcodeResponse: null == passcodeResponse
          ? _value.passcodeResponse
          : passcodeResponse // ignore: cast_nullable_to_non_nullable
              as PasscodeResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserFromSignupCopyWith<$Res> get userFromSignup {
    return $UserFromSignupCopyWith<$Res>(_value.userFromSignup, (value) {
      return _then(_value.copyWith(userFromSignup: value) as $Val);
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
abstract class _$$UserSignupDTOImplCopyWith<$Res>
    implements $UserSignupDTOCopyWith<$Res> {
  factory _$$UserSignupDTOImplCopyWith(
          _$UserSignupDTOImpl value, $Res Function(_$UserSignupDTOImpl) then) =
      __$$UserSignupDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserFromSignup userFromSignup, PasscodeResponse passcodeResponse});

  @override
  $UserFromSignupCopyWith<$Res> get userFromSignup;
  @override
  $PasscodeResponseCopyWith<$Res> get passcodeResponse;
}

/// @nodoc
class __$$UserSignupDTOImplCopyWithImpl<$Res>
    extends _$UserSignupDTOCopyWithImpl<$Res, _$UserSignupDTOImpl>
    implements _$$UserSignupDTOImplCopyWith<$Res> {
  __$$UserSignupDTOImplCopyWithImpl(
      _$UserSignupDTOImpl _value, $Res Function(_$UserSignupDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userFromSignup = null,
    Object? passcodeResponse = null,
  }) {
    return _then(_$UserSignupDTOImpl(
      userFromSignup: null == userFromSignup
          ? _value.userFromSignup
          : userFromSignup // ignore: cast_nullable_to_non_nullable
              as UserFromSignup,
      passcodeResponse: null == passcodeResponse
          ? _value.passcodeResponse
          : passcodeResponse // ignore: cast_nullable_to_non_nullable
              as PasscodeResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSignupDTOImpl implements _UserSignupDTO {
  const _$UserSignupDTOImpl(
      {required this.userFromSignup, required this.passcodeResponse});

  factory _$UserSignupDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSignupDTOImplFromJson(json);

  @override
  final UserFromSignup userFromSignup;
  @override
  final PasscodeResponse passcodeResponse;

  @override
  String toString() {
    return 'UserSignupDTO(userFromSignup: $userFromSignup, passcodeResponse: $passcodeResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSignupDTOImpl &&
            (identical(other.userFromSignup, userFromSignup) ||
                other.userFromSignup == userFromSignup) &&
            (identical(other.passcodeResponse, passcodeResponse) ||
                other.passcodeResponse == passcodeResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userFromSignup, passcodeResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSignupDTOImplCopyWith<_$UserSignupDTOImpl> get copyWith =>
      __$$UserSignupDTOImplCopyWithImpl<_$UserSignupDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSignupDTOImplToJson(
      this,
    );
  }
}

abstract class _UserSignupDTO implements UserSignupDTO {
  const factory _UserSignupDTO(
      {required final UserFromSignup userFromSignup,
      required final PasscodeResponse passcodeResponse}) = _$UserSignupDTOImpl;

  factory _UserSignupDTO.fromJson(Map<String, dynamic> json) =
      _$UserSignupDTOImpl.fromJson;

  @override
  UserFromSignup get userFromSignup;
  @override
  PasscodeResponse get passcodeResponse;
  @override
  @JsonKey(ignore: true)
  _$$UserSignupDTOImplCopyWith<_$UserSignupDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
