import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/swagger_info_contact.dart';
import 'package:swagger_parser/models/swagger_document/swagger_info_license.dart';

part 'swagger_server.g.dart';

@JsonSerializable()
class SwaggerServer {
  SwaggerServer({
    required this.url,
    this.description,
    this.variables,
  });

  /// REQUIRED. A URL to the target host. This URL supports Server Variables and MAY be relative,
  /// to indicate that the host location is relative to the location where the OpenAPI document
  /// is being served. Variable substitutions will be made when a variable is named in {brackets}.
  final String url;

  /// An optional string describing the host designated by the URL. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  /// A map between a variable name and its value. The value is used for substitution in the server's URL template.
  final Map<String, dynamic>? variables;

  factory SwaggerServer.fromJson(Map<String, dynamic> json) =>
      _$SwaggerServerFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerServerToJson(this);
}
