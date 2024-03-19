import 'package:json_annotation/json_annotation.dart';

part 'swagger_info_contact.g.dart';

@JsonSerializable()
class SwaggerInfoContact {
  SwaggerInfoContact({
    this.name,
    this.url,
    this.email,
  });

  /// The identifying name of the contact person/organization.
  final String? name;

  /// The URL pointing to the contact information. MUST be in the format of a URL.
  final String? url;

  /// The email address of the contact person/organization. MUST be in the format of an email address.
  final String? email;

  factory SwaggerInfoContact.fromJson(Map<String, dynamic> json) =>
      _$SwaggerInfoContactFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerInfoContactToJson(this);
}
