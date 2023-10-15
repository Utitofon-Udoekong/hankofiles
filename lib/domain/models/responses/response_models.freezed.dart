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
  int get id => throw _privateConstructorUsedError;
  String get ttl => throw _privateConstructorUsedError;

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
      int id,
      String ttl});
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
              as int,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as String,
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
      int id,
      String ttl});
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
              as int,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as String,
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
  final int id;
  @override
  final String ttl;

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
      required final int id,
      required final String ttl}) = _$PasscodeResponseImpl;

  factory _PasscodeResponse.fromJson(Map<String, dynamic> json) =
      _$PasscodeResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: getDateTimeFromISO8601String)
  DateTime get created_at;
  @override
  int get id;
  @override
  String get ttl;
  @override
  @JsonKey(ignore: true)
  _$$PasscodeResponseImplCopyWith<_$PasscodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
