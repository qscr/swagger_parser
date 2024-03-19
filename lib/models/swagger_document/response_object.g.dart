// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseObjectImpl _$ResponseObjectImplFromJson(Map<String, dynamic> json) =>
    ResponseObjectImpl(
      description: json['description'] as String,
      content: (json['content'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, MediaTypeObject.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ResponseObjectImplToJson(ResponseObjectImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'content': instance.content,
    };
