import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';

part 'media_type_object.g.dart';

@JsonSerializable()
class MediaTypeObject {
  MediaTypeObject({
    required this.schema,
    this.example,
  });

  /// The schema defining the content of the request, response, or parameter.
  final SchemaOrReferenceObject? schema;

  final dynamic example;

  factory MediaTypeObject.fromJson(Map<String, dynamic> json) =>
      _$MediaTypeObjectFromJson(json);

  Map<String, dynamic> toJson() => _$MediaTypeObjectToJson(this);
}
