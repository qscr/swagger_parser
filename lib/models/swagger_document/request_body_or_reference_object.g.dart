// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body_or_reference_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestBody _$RequestBodyFromJson(Map<String, dynamic> json) => RequestBody(
      content: (json['content'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, MediaTypeObject.fromJson(e as Map<String, dynamic>)),
      ),
      description: json['description'] as String?,
      required: json['required'] as bool? ?? false,
    );

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) =>
    <String, dynamic>{
      'description': instance.description,
      'content': instance.content,
      'required': instance.required,
    };

ReferenceObject _$ReferenceObjectFromJson(Map<String, dynamic> json) =>
    ReferenceObject(
      ref: json[r'$ref'] as String,
    );

Map<String, dynamic> _$ReferenceObjectToJson(ReferenceObject instance) =>
    <String, dynamic>{
      r'$ref': instance.ref,
    };
