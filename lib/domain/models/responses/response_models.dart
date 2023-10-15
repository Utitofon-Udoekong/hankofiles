import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hankofiles/constants/methods.dart';

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

class UserFromEmail {
  final String email_id;
  final bool has_webauthn_credential;
  final String id;
  final bool verified;
  UserFromEmail({
    required this.email_id,
    required this.has_webauthn_credential,
    required this.id,
    required this.verified
});

  Map<String, dynamic> toMap() {
    return {
      'email_id': email_id,
      'has_webauthn_credential': has_webauthn_credential,
      'id': id,
      'verified': verified,
    };
  }

  factory UserFromEmail.fromMap(Map<String, dynamic> map) {
    return UserFromEmail(
      email_id: map['email_id'] ?? '',
      has_webauthn_credential: map['has_webauthn_credential'] ?? false,
      id: map['id'] ?? '',
      verified: map['verified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFromEmail.fromJson(String source) => UserFromEmail.fromMap(json.decode(source));
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
