// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestBodyObjectImpl _$RequestBodyObjectImplFromJson(
        Map<String, dynamic> json) =>
    RequestBodyObjectImpl(
      description: json['description'] as String?,
      content: (json['content'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, MediaTypeObject.fromJson(e as Map<String, dynamic>)),
      ),
      required: json['required'] as bool? ?? false,
    );

Map<String, dynamic> _$RequestBodyObjectImplToJson(
        RequestBodyObjectImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'content': instance.content,
      'required': instance.required,
    };
