import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/media_type_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';

part 'request_body_object.g.dart';

@JsonSerializable()
class RequestBodyObjectImpl {
  RequestBodyObjectImpl({
    this.description,
    required this.content,
    this.required = false,
  });

  /// A brief description of the request body. This could contain examples of use. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  /// REQUIRED. The content of the request body. The key is a media type or
  /// media type range and the value describes it. For requests that match
  /// multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  final Map<String, MediaTypeObject> content;

  final bool required;

  factory RequestBodyObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyObjectImplFromJson(json);

  Map<String, dynamic> toJson() => _$RequestBodyObjectImplToJson(this);

  SwaggerRequestParameter? toRequestParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    final childParameter =
        content.entries.firstOrNull?.value.schema?.toRequestParameter(
      key: key,
      doc: doc,
    );
    if (childParameter == null) {
      return null;
    }
    return SwaggerRequestParameter(
      type: ParameterType.object,
      location: ParameterLocation.body,
      childParameters: childParameter.childParameters,
    );
  }
}
