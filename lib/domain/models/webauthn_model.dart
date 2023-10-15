import 'dart:convert';

import 'package:flutter/foundation.dart';

class WebAuthN {
      final String aaguid;
      final String attestation_type;
      final String created_at;
      final String id;
      final String name;
      final String public_key;
      final List<String> transport;
  WebAuthN({
    required this.aaguid,
    required this.attestation_type,
    required this.created_at,
    required this.id,
    required this.name,
    required this.public_key,
    required this.transport,
  });

  WebAuthN copyWith({
    String? aaguid,
    String? attestation_type,
    String? created_at,
    String? id,
    String? name,
    String? public_key,
    List<String>? transport,
  }) {
    return WebAuthN(
      aaguid: aaguid ?? this.aaguid,
      attestation_type: attestation_type ?? this.attestation_type,
      created_at: created_at ?? this.created_at,
      id: id ?? this.id,
      name: name ?? this.name,
      public_key: public_key ?? this.public_key,
      transport: transport ?? this.transport,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aaguid': aaguid,
      'attestation_type': attestation_type,
      'created_at': created_at,
      'id': id,
      'name': name,
      'public_key': public_key,
      'transport': transport,
    };
  }

  factory WebAuthN.fromMap(Map<String, dynamic> map) {
    return WebAuthN(
      aaguid: map['aaguid'] ?? '',
      attestation_type: map['attestation_type'] ?? '',
      created_at: map['created_at'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      public_key: map['public_key'] ?? '',
      transport: List<String>.from(map['transport']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WebAuthN.fromJson(String source) => WebAuthN.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WebAuthN(aaguid: $aaguid, attestation_type: $attestation_type, created_at: $created_at, id: $id, name: $name, public_key: $public_key, transport: $transport)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WebAuthN &&
      other.aaguid == aaguid &&
      other.attestation_type == attestation_type &&
      other.created_at == created_at &&
      other.id == id &&
      other.name == name &&
      other.public_key == public_key &&
      listEquals(other.transport, transport);
  }

  @override
  int get hashCode {
    return aaguid.hashCode ^
      attestation_type.hashCode ^
      created_at.hashCode ^
      id.hashCode ^
      name.hashCode ^
      public_key.hashCode ^
      transport.hashCode;
  }
}
