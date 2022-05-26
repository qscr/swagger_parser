// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequestParameter _$SwaggerRequestParameterFromJson(
        Map<String, dynamic> json) =>
    SwaggerRequestParameter(
      name: json['name'] as String,
      type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
      location: $enumDecode(_$ParameterLocationEnumMap, json['location']),
      description: json['description'] as String?,
      childParameters: (json['childParameters'] as List<dynamic>?)
          ?.map((e) => BaseParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      nullable: json['nullable'] as bool?,
      format: json['format'] as String?,
    );

Map<String, dynamic> _$SwaggerRequestParameterToJson(
        SwaggerRequestParameter instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'type': _$ParameterTypeEnumMap[instance.type],
      'format': instance.format,
      'nullable': instance.nullable,
      'childParameters': instance.childParameters,
      'location': _$ParameterLocationEnumMap[instance.location],
    };

const _$ParameterTypeEnumMap = {
  ParameterType.integer: 'integer',
  ParameterType.double: 'double',
  ParameterType.string: 'string',
  ParameterType.bool: 'bool',
  ParameterType.array: 'array',
  ParameterType.object: 'object',
  ParameterType.file: 'file',
  ParameterType.number: 'number',
  ParameterType.boolean: 'boolean',
};

const _$ParameterLocationEnumMap = {
  ParameterLocation.path: 'path',
  ParameterLocation.headers: 'headers',
  ParameterLocation.query: 'query',
  ParameterLocation.body: 'body',
};
