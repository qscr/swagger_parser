// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_documentation_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalDocumentationObject _$ExternalDocumentationObjectFromJson(
        Map<String, dynamic> json) =>
    ExternalDocumentationObject(
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ExternalDocumentationObjectToJson(
        ExternalDocumentationObject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
