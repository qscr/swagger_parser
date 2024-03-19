// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerInfo _$SwaggerInfoFromJson(Map<String, dynamic> json) => SwaggerInfo(
      title: json['title'] as String,
      description: json['description'] as String?,
      termsOfService: json['termsOfService'] as String?,
      contact: json['contact'] == null
          ? null
          : SwaggerInfoContact.fromJson(
              json['contact'] as Map<String, dynamic>),
      license: json['license'] == null
          ? null
          : SwaggerInfoLicense.fromJson(
              json['license'] as Map<String, dynamic>),
      version: json['version'] as String,
    );

Map<String, dynamic> _$SwaggerInfoToJson(SwaggerInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'termsOfService': instance.termsOfService,
      'contact': instance.contact,
      'license': instance.license,
      'version': instance.version,
    };
