// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<EmailObject> get emails => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
      DateTime createdAt,
      List<EmailObject> emails,
      String id,
      @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
      DateTime updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? emails = null,
    Object? id = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emails: null == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<EmailObject>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
      DateTime createdAt,
      List<EmailObject> emails,
      String id,
      @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
      DateTime updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? emails = null,
    Object? id = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserModelImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emails: null == emails
          ? _value._emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<EmailObject>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
      required this.createdAt,
      required final List<EmailObject> emails,
      required this.id,
      @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
      required this.updatedAt})
      : _emails = emails;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
  final DateTime createdAt;
  final List<EmailObject> _emails;
  @override
  List<EmailObject> get emails {
    if (_emails is EqualUnmodifiableListView) return _emails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emails);
  }

  @override
  final String id;
  @override
  @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, emails: $emails, id: $id, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._emails, _emails) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt,
      const DeepCollectionEquality().hash(_emails), id, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
      required final DateTime createdAt,
      required final List<EmailObject> emails,
      required final String id,
      @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
      required final DateTime updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String)
  DateTime get createdAt;
  @override
  List<EmailObject> get emails;
  @override
  String get id;
  @override
  @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
