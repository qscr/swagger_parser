// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_or_reference_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseObject _$ResponseObjectFromJson(Map<String, dynamic> json) =>
    ResponseObject(
      content: (json['content'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, MediaTypeObject.fromJson(e as Map<String, dynamic>)),
      ),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ResponseObjectToJson(ResponseObject instance) =>
    <String, dynamic>{
      'description': instance.description,
      'content': instance.content,
    };

ReferenceObject _$ReferenceObjectFromJson(Map<String, dynamic> json) =>
    ReferenceObject(
      ref: json[r'$ref'] as String,
    );

Map<String, dynamic> _$ReferenceObjectToJson(ReferenceObject instance) =>
    <String, dynamic>{
      r'$ref': instance.ref,
    };
