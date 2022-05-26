// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerMethod _$SwaggerMethodFromJson(Map<String, dynamic> json) =>
    SwaggerMethod(
      name: json['name'] as String,
      type: $enumDecode(_$MethodTypeEnumMap, json['type']),
      description: json['description'] as String?,
      requestParameters: (json['requestParameters'] as List<dynamic>?)
          ?.map((e) =>
              SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseParameters: (json['responseParameters'] as List<dynamic>?)
          ?.map((e) =>
              SwaggerResponseParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SwaggerMethodToJson(SwaggerMethod instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$MethodTypeEnumMap[instance.type],
      'description': instance.description,
      'requestParameters': instance.requestParameters,
      'responseParameters': instance.responseParameters,
    };

const _$MethodTypeEnumMap = {
  MethodType.get: 'get',
  MethodType.post: 'post',
  MethodType.put: 'put',
  MethodType.delete: 'delete',
};
