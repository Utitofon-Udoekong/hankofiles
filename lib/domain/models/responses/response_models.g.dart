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
