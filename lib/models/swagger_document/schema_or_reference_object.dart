import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/reference_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

part 'schema_or_reference_object.g.dart';

sealed class SchemaOrReferenceObject {
  SchemaOrReferenceObject();

  factory SchemaOrReferenceObject.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('\$ref')) {
      return ReferenceObject.fromJson(json);
    }
    return SchemaObject.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    switch (this) {
      case SchemaObject schema:
        return schema.toJson();
      case ReferenceObject ref:
        return ref.toJson();
    }
  }
}

extension SchemaOrReferenceObjectExt on SchemaOrReferenceObject {
  SwaggerRequestParameter? toRequestParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    switch (this) {
      case SchemaObject schema:
        return schema.toRequestParameter(
          key: key,
          doc: doc,
          location: ParameterLocation.body,
        );
      case ReferenceObject ref:
        final cachedRef = doc.cachedRequestParameters[ref.refName];
        if (cachedRef != null) {
          return cachedRef;
        }
        return ref.toRequestParameter(doc: doc, key: key);
    }
  }

  SwaggerResponseParameter? toResponseParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    switch (this) {
      case SchemaObject schema:
        return schema.toResponseParameter(
          key: key,
          doc: doc,
        );
      case ReferenceObject ref:
        final cachedRef = doc.cachedResponseParameters[ref.refName];
        if (cachedRef != null) {
          return cachedRef;
        }
        return ref.toResponseParameter(doc: doc, key: key);
    }
  }

  ParameterType get parameterType {
    switch (this) {
      case SchemaObject schema:
        return schema.parameterType;
      case ReferenceObject _:
        return ParameterType.object;
    }
  }
}

@JsonSerializable()
class SchemaObject extends SchemaObjectImpl implements SchemaOrReferenceObject {
  SchemaObject({
    required super.title,
    super.multipleOf,
    super.maximum,
    super.exclusiveMaximum,
    super.minimum,
    super.exclusiveMinimum,
    super.maxLength,
    super.minLength,
    super.pattern,
    super.maxItems,
    super.minItems,
    super.required,
    super.type,
    super.allOf,
    super.oneOf,
    super.anyOf,
    super.not,
    super.items,
    super.properties,
  });

  factory SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectFromJson(json);
}

@JsonSerializable()
class ReferenceObject extends ReferenceObjectImpl
    implements SchemaOrReferenceObject {
  ReferenceObject({required super.ref});

  factory ReferenceObject.fromJson(Map<String, dynamic> json) =>
      _$ReferenceObjectFromJson(json);
}
