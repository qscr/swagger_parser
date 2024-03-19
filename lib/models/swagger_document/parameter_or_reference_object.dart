import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/parameter_object.dart';
import 'package:swagger_parser/models/swagger_document/reference_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';

part 'parameter_or_reference_object.g.dart';

sealed class ParameterOrReferenceObject {
  ParameterOrReferenceObject();

  factory ParameterOrReferenceObject.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('\$ref')) {
      return ReferenceObject.fromJson(json);
    }
    return ParameterObject.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    switch (this) {
      case ParameterObject parameter:
        return parameter.toJson();
      case ReferenceObject ref:
        return ref.toJson();
    }
  }
}

extension ParameterOrReferenceObjectExt on ParameterOrReferenceObject {
  SwaggerRequestParameter? toParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    switch (this) {
      case ParameterObject parameter:
        return parameter.toRequestParameter(
          doc: doc,
        );
      case ReferenceObject ref:
        return ref.toRequestParameter(
          key: key,
          doc: doc,
        );
    }
  }
}

class ParameterObject extends ParameterObjectImpl
    implements ParameterOrReferenceObject {
  ParameterObject({
    required super.name,
    required super.location,
    required super.example,
    required super.examples,
    required super.description,
    required super.required,
    required super.deprecated,
    required super.allowEmptyValue,
    required super.style,
    required super.explode,
    required super.allowReserved,
    required super.schema,
    required super.type,
  });

  factory ParameterObject.fromJson(Map<String, dynamic> json) =>
      ParameterObject.toParameterObject(
          ParameterObjectImpl.fromJson(json) as dynamic);

  static ParameterObject toParameterObject(ParameterObjectImpl impl) =>
      ParameterObject(
        name: impl.name,
        location: impl.location,
        example: impl.example,
        examples: impl.examples,
        description: impl.description,
        required: impl.required,
        deprecated: impl.deprecated,
        allowEmptyValue: impl.allowEmptyValue,
        style: impl.style,
        explode: impl.explode,
        allowReserved: impl.allowReserved,
        schema: impl.schema,
        type: impl.type,
      );
}

@JsonSerializable()
class ReferenceObject extends ReferenceObjectImpl
    implements ParameterOrReferenceObject {
  ReferenceObject({required super.ref});

  factory ReferenceObject.fromJson(Map<String, dynamic> json) =>
      _$ReferenceObjectFromJson(json);
}
