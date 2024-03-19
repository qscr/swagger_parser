import 'package:json_annotation/json_annotation.dart';

part 'swagger_info_license.g.dart';

@JsonSerializable()
class SwaggerInfoLicense {
  SwaggerInfoLicense({
    required this.name,
    this.url,
  });

  /// REQUIRED. The license name used for the API.
  final String name;

  /// A URL to the license used for the API. MUST be in the format of a URL.
  final String? url;

  factory SwaggerInfoLicense.fromJson(Map<String, dynamic> json) =>
      _$SwaggerInfoLicenseFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerInfoLicenseToJson(this);
}
