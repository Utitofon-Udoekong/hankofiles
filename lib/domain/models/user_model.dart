import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/domain/models/responses/response_models.dart';
import 'package:hankofiles/domain/models/webauthn_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "created_at", fromJson: getDateTimeFromISO8601String) required DateTime createdAt,
    required List<EmailObject> emails,
    required String id,
    @JsonKey(name: "updated_at", fromJson: getDateTimeFromISO8601String) required DateTime updatedAt,
    @JsonKey(name: "webauthn_credentials") List<WebAuthN>? webAuthNCredentials,

  }) = _UserModel;

  factory UserModel.empty() => UserModel(createdAt: DateTime.now(), emails: [], id: "", updatedAt: DateTime.now(),);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

