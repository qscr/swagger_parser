import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/media_type_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

part 'response_object.g.dart';

@JsonSerializable()
class ResponseObjectImpl {
  ResponseObjectImpl({
    required this.description,
    required this.content,
  });

  /// REQUIRED. A short description of the response. CommonMark syntax MAY be used for rich text representation.
  final String description;

  /// A map containing descriptions of potential response payloads.
  /// The key is a media type or media type range and the value describes it.
  /// For responses that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  final Map<String, MediaTypeObject>? content;

  factory ResponseObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$ResponseObjectImplFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseObjectImplToJson(this);

  SwaggerResponseParameter? toResponseParameter({
    required SwaggerDoc doc,
  }) {
    return content?.entries.firstOrNull?.value.schema?.toResponseParameter(
      doc: doc,
    );
  }
}
