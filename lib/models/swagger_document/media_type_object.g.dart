// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaTypeObject _$MediaTypeObjectFromJson(Map<String, dynamic> json) =>
    MediaTypeObject(
      schema: json['schema'] == null
          ? null
          : SchemaOrReferenceObject.fromJson(
              json['schema'] as Map<String, dynamic>),
      example: json['example'],
    );

Map<String, dynamic> _$MediaTypeObjectToJson(MediaTypeObject instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'example': instance.example,
    };
