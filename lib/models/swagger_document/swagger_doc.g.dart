// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerDoc _$SwaggerDocFromJson(Map<String, dynamic> json) => SwaggerDoc(
      openapi: json['openapi'] as String,
      info: SwaggerInfo.fromJson(json['info'] as Map<String, dynamic>),
      servers: (json['servers'] as List<dynamic>?)
              ?.map((e) => SwaggerServer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paths: (json['paths'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, PathItemObject.fromJson(e as Map<String, dynamic>)),
      ),
      components: json['components'] == null
          ? null
          : ComponentsObject.fromJson(
              json['components'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SwaggerDocToJson(SwaggerDoc instance) =>
    <String, dynamic>{
      'openapi': instance.openapi,
      'info': instance.info,
      'servers': instance.servers,
      'paths': instance.paths,
      'components': instance.components,
    };
