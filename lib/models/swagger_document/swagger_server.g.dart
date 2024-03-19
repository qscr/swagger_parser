// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerServer _$SwaggerServerFromJson(Map<String, dynamic> json) =>
    SwaggerServer(
      url: json['url'] as String,
      description: json['description'] as String?,
      variables: json['variables'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SwaggerServerToJson(SwaggerServer instance) =>
    <String, dynamic>{
      'url': instance.url,
      'description': instance.description,
      'variables': instance.variables,
    };
