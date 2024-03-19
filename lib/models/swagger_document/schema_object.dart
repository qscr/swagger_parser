import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

part 'schema_object.g.dart';

@JsonSerializable()
class SchemaObjectImpl {
  SchemaObjectImpl({
    required this.title,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.maxItems,
    this.minItems,
    this.required,
    this.type,
    this.allOf,
    this.oneOf,
    this.anyOf,
    this.not,
    this.items,
    this.properties,
  });

  final dynamic title;

  final int? multipleOf;

  final int? maximum;

  final int? exclusiveMaximum;

  final int? minimum;

  final int? exclusiveMinimum;

  final int? maxLength;

  final int? minLength;

  final String? pattern;

  final int? maxItems;

  final int? minItems;

  final List<String>? required;

  /// Value MUST be a string. Multiple types via an array are not supported.
  final String? type;

  /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
  final SchemaOrReferenceObject? allOf;

  /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
  final SchemaOrReferenceObject? oneOf;

  /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
  final SchemaOrReferenceObject? anyOf;

  /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
  final SchemaOrReferenceObject? not;

  /// Value MUST be an object and not an array. Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema. items MUST be present if the type is array.
  final SchemaOrReferenceObject? items;

  /// Property definitions MUST be a Schema Object and not a standard JSON Schema (inline or referenced).
  final Map<String, SchemaOrReferenceObject>? properties;

  ParameterType get parameterType => ParameterType.fromString(type!);

  factory SchemaObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectImplFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaObjectImplToJson(this);

  SwaggerRequestParameter? toRequestParameter({
    required SwaggerDoc doc,
    required ParameterLocation location,
    String? key,
  }) {
    if (parameterType == ParameterType.array) {
      if (items == null) {
        return null;
      }
      final itemParam = items!.toRequestParameter(
        doc: doc,
        key: key,
      );
      return SwaggerRequestParameter(
        type: parameterType,
        location: location,
        childParameters: [
          itemParam!,
        ],
      );
    }
    return SwaggerRequestParameter(
      name: key,
      location: location,
      type: parameterType,
      childParameters: properties?.entries
          .map(
            (e) => e.value.toRequestParameter(
              key: e.key,
              doc: doc,
            ),
          )
          .whereNotNull()
          .toList(),
    );
  }

  SwaggerResponseParameter? toResponseParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    if (parameterType == ParameterType.array) {
      if (items == null) {
        return null;
      }
      final itemParam = items!.toResponseParameter(
        doc: doc,
        key: key,
      );
      return SwaggerResponseParameter(
        type: parameterType,
        childParameters: [
          itemParam!,
        ],
      );
    }
    return SwaggerResponseParameter(
      name: key,
      type: parameterType,
      childParameters: properties?.entries
          .map(
            (e) => e.value.toResponseParameter(
              key: e.key,
              doc: doc,
            ),
          )
          .whereNotNull()
          .toList(),
    );
  }
}
