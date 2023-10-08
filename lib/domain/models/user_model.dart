import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/constants/methods.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String) required DateTime createdAt,
    required List<EmailObject> emails,
    required String id,
    @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String) required DateTime updatedAt
  }) = _UserModel;

  factory UserModel.empty() => UserModel(createdAt: DateTime.now(), emails: [], id: "", updatedAt: DateTime.now(),);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

class EmailObject {
  final String address;
  @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String) DateTime? createdAt;
  String? id;
  bool? is_primary;
  bool? is_verified;
  @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String) DateTime? updatedAt;

  EmailObject({
    required this.address,
    this.createdAt,
    this.id,
    this.is_primary,
    this.is_verified,
    this.updatedAt,
  });
}