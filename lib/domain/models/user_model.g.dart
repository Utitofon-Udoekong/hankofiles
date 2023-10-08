// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: getDateTimeFromISO8601String(json['created_at'] as String),
      emails: (json['emails'] as List<dynamic>)
          .map((e) => EmailObject.fromJson(e as String))
          .toList(),
      id: json['id'] as String,
      updatedAt: getDateTimeFromISO8601String(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'emails': instance.emails,
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
