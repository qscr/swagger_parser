// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterObjectImpl _$ParameterObjectImplFromJson(Map<String, dynamic> json) =>
    ParameterObjectImpl(
      name: json['name'] as String,
      location: json['in'] as String,
      description: json['description'] as String?,
      required: json['required'] as bool?,
      deprecated: json['deprecated'] as bool?,
      allowEmptyValue: json['allowEmptyValue'] as bool?,
      style: json['style'] as String?,
      explode: json['explode'] as bool?,
      allowReserved: json['allowReserved'] as bool?,
      schema: json['schema'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['schema'] as Map<String, dynamic>),
      example: json['example'],
      examples: json['examples'],
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ParameterObjectImplToJson(
        ParameterObjectImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'in': instance.location,
      'description': instance.description,
      'required': instance.required,
      'deprecated': instance.deprecated,
      'allowEmptyValue': instance.allowEmptyValue,
      'style': instance.style,
      'explode': instance.explode,
      'allowReserved': instance.allowReserved,
      'schema': instance.schema,
      'example': instance.example,
      'examples': instance.examples,
      'type': instance.type,
    };
