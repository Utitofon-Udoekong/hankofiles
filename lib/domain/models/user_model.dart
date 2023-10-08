import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required DateTime created_at,
    required List<EmailObject> emails,
    required String id,
    required DateTime updated_at
  }) = _UserModel;
}

class EmailObject {
  final String address;
  final DateTime created_at;
  final String id;
  final bool is_primary;
  final bool is_verified;
  final DateTime updated_at;

  EmailObject({
    required this.address,
    required this.created_at,
    required this.id,
    required this.is_primary,
    required this.is_verified,
    required this.updated_at,
  })
}