import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/components_object.dart';
import 'package:swagger_parser/models/swagger_document/path_item_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_info.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_server.dart';

part 'swagger_doc.g.dart';

@JsonSerializable()
class SwaggerDoc {
  SwaggerDoc({
    required this.openapi,
    required this.info,
    this.servers = const [],
    required this.paths,
    this.components,
  })  : cachedRequestParameters = {},
        cachedResponseParameters = {};

  /// REQUIRED. This string MUST be the semantic version number of the OpenAPI Specification
  /// version that the OpenAPI document uses. The openapi field SHOULD be used by tooling
  /// specifications and clients to interpret the OpenAPI document. This is not related to the API info.version string.
  final String openapi;

  /// REQUIRED. Provides metadata about the API. The metadata MAY be used by tooling as required.
  final SwaggerInfo info;

  /// An array of Server Objects, which provide connectivity information to a target server.
  /// If the servers property is not provided, or is an empty array,
  /// the default value would be a Server Object with a url value of /.
  final List<SwaggerServer> servers;

  final Map<String, PathItemObject> paths;

  final ComponentsObject? components;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, SwaggerRequestParameter> cachedRequestParameters;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, SwaggerResponseParameter> cachedResponseParameters;

  factory SwaggerDoc.fromJson(Map<String, dynamic> json) =>
      _$SwaggerDocFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerDocToJson(this);
}
