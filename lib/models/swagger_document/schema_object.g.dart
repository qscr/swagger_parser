// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaObjectImpl _$SchemaObjectImplFromJson(Map<String, dynamic> json) =>
    SchemaObjectImpl(
      title: json['title'],
      multipleOf: json['multipleOf'] as int?,
      maximum: json['maximum'] as int?,
      exclusiveMaximum: json['exclusiveMaximum'] as int?,
      minimum: json['minimum'] as int?,
      exclusiveMinimum: json['exclusiveMinimum'] as int?,
      maxLength: json['maxLength'] as int?,
      minLength: json['minLength'] as int?,
      pattern: json['pattern'] as String?,
      maxItems: json['maxItems'] as int?,
      minItems: json['minItems'] as int?,
      required: (json['required'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
      allOf: json['allOf'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['allOf'] as Map<String, dynamic>),
      oneOf: json['oneOf'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['oneOf'] as Map<String, dynamic>),
      anyOf: json['anyOf'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['anyOf'] as Map<String, dynamic>),
      not: json['not'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['not'] as Map<String, dynamic>),
      items: json['items'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['items'] as Map<String, dynamic>),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, SchemaOrReferenceObject.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SchemaObjectImplToJson(SchemaObjectImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'multipleOf': instance.multipleOf,
      'maximum': instance.maximum,
      'exclusiveMaximum': instance.exclusiveMaximum,
      'minimum': instance.minimum,
      'exclusiveMinimum': instance.exclusiveMinimum,
      'maxLength': instance.maxLength,
      'minLength': instance.minLength,
      'pattern': instance.pattern,
      'maxItems': instance.maxItems,
      'minItems': instance.minItems,
      'required': instance.required,
      'type': instance.type,
      'allOf': instance.allOf,
      'oneOf': instance.oneOf,
      'anyOf': instance.anyOf,
      'not': instance.not,
      'items': instance.items,
      'properties': instance.properties,
    };
