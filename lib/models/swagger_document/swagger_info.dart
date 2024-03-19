import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/swagger_info_contact.dart';
import 'package:swagger_parser/models/swagger_document/swagger_info_license.dart';

part 'swagger_info.g.dart';

@JsonSerializable()
class SwaggerInfo {
  SwaggerInfo({
    required this.title,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
    required this.version,
  });

  /// REQUIRED. The title of the API.
  final String title;

  /// A short description of the API. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  /// A URL to the Terms of Service for the API. MUST be in the format of a URL.
  final String? termsOfService;

  /// The contact information for the exposed API.
  final SwaggerInfoContact? contact;

  /// The license information for the exposed API.
  final SwaggerInfoLicense? license;

  /// REQUIRED. The version of the OpenAPI document (which is distinct from the OpenAPI Specification version or the API implementation version).
  final String version;

  factory SwaggerInfo.fromJson(Map<String, dynamic> json) =>
      _$SwaggerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerInfoToJson(this);
}
