// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasscodeResponseImpl _$$PasscodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PasscodeResponseImpl(
      created_at: getDateTimeFromISO8601String(json['created_at'] as String),
      id: json['id'] as String,
      ttl: json['ttl'] as int,
    );

Map<String, dynamic> _$$PasscodeResponseImplToJson(
        _$PasscodeResponseImpl instance) =>
    <String, dynamic>{
      'created_at': instance.created_at.toIso8601String(),
      'id': instance.id,
      'ttl': instance.ttl,
    };

_$UserFromEmailImpl _$$UserFromEmailImplFromJson(Map<String, dynamic> json) =>
    _$UserFromEmailImpl(
      email_id: json['email_id'] as String,
      has_webauthn_credential: json['has_webauthn_credential'] as bool,
      id: json['id'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$$UserFromEmailImplToJson(_$UserFromEmailImpl instance) =>
    <String, dynamic>{
      'email_id': instance.email_id,
      'has_webauthn_credential': instance.has_webauthn_credential,
      'id': instance.id,
      'verified': instance.verified,
    };

_$UserFromSignupImpl _$$UserFromSignupImplFromJson(Map<String, dynamic> json) =>
    _$UserFromSignupImpl(
      email_id: json['email_id'] as String,
      id: json['id'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$$UserFromSignupImplToJson(
        _$UserFromSignupImpl instance) =>
    <String, dynamic>{
      'email_id': instance.email_id,
      'id': instance.id,
      'user_id': instance.user_id,
    };

_$UserSignupDTOImpl _$$UserSignupDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserSignupDTOImpl(
      userFromSignup: UserFromSignup.fromJson(
          json['userFromSignup'] as Map<String, dynamic>),
      passcodeResponse: PasscodeResponse.fromJson(
          json['passcodeResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSignupDTOImplToJson(_$UserSignupDTOImpl instance) =>
    <String, dynamic>{
      'userFromSignup': instance.userFromSignup,
      'passcodeResponse': instance.passcodeResponse,
    };
