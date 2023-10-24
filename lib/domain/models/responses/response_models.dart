import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hankofiles/constants/methods.dart';
import 'package:hankofiles/domain/models/user_model.dart';

part 'response_models.freezed.dart';
part 'response_models.g.dart';

@freezed
abstract class PasscodeResponse with _$PasscodeResponse {
  const factory PasscodeResponse({
    @JsonKey(fromJson: getDateTimeFromISO8601String) required DateTime created_at,
        required String id,
        required int ttl,
  }) = _PasscodeResponse;

  factory PasscodeResponse.empty() => PasscodeResponse(created_at: DateTime.now(), id: "", ttl: 0);

  factory PasscodeResponse.fromJson(Map<String, dynamic> json) => _$PasscodeResponseFromJson(json);
}

@freezed
abstract class UserFromEmail with _$UserFromEmail {
  const factory UserFromEmail({
    required String email_id,
    required bool has_webauthn_credential,
    required String id,
    required bool verified,
  }) = _UserFromEmail;
  
  factory UserFromEmail.empty() => const UserFromEmail(email_id: '', has_webauthn_credential: false, id: '', verified: false);
  factory UserFromEmail.fromJson(Map<String, dynamic> json) => _$UserFromEmailFromJson(json);
}

@freezed
abstract class UserFromSignup with _$UserFromSignup {
  const factory UserFromSignup({
    required String email_id,
    required String id,
    required String user_id,
  }) = _UserFromSignup;
  
  factory UserFromSignup.empty() => const UserFromSignup(email_id: '', user_id: '', id: '');
  factory UserFromSignup.fromJson(Map<String, dynamic> json) => _$UserFromSignupFromJson(json);
}

@freezed
abstract class UserSignupDTO with _$UserSignupDTO {
  const factory UserSignupDTO({
    required UserFromSignup userFromSignup,
    required PasscodeResponse passcodeResponse,
  }) = _UserSignupDTO;
  
  factory UserSignupDTO.empty() => UserSignupDTO(userFromSignup: UserFromSignup.empty(), passcodeResponse: PasscodeResponse.empty());
  factory UserSignupDTO.fromJson(Map<String, dynamic> json) => _$UserSignupDTOFromJson(json);
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

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'id': id,
      'is_primary': is_primary,
      'is_verified': is_verified,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory EmailObject.fromMap(Map<String, dynamic> map) {
    return EmailObject(
      address: map['address'] ?? '',
      id: map['id'],
      is_primary: map['is_primary'],
      is_verified: map['is_verified'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt']
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailObject.fromJson(String source) => EmailObject.fromMap(json.decode(source));
}
