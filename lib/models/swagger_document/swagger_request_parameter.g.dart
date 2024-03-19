// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_request_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerRequestParameter _$SwaggerRequestParameterFromJson(
        Map<String, dynamic> json) =>
    SwaggerRequestParameter(
      type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
      location: $enumDecode(_$ParameterLocationEnumMap, json['location']),
      name: json['name'] as String?,
      description: json['description'] as String?,
      childParameters: (json['childParameters'] as List<dynamic>?)
          ?.map((e) =>
              SwaggerRequestParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      required: json['required'] as bool?,
      format: json['format'] as String?,
    )..childrenBaseType =
        $enumDecodeNullable(_$ParameterTypeEnumMap, json['childrenBaseType']);

Map<String, dynamic> _$SwaggerRequestParameterToJson(
        SwaggerRequestParameter instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'type': _$ParameterTypeEnumMap[instance.type]!,
      'format': instance.format,
      'required': instance.required,
      'childrenBaseType': _$ParameterTypeEnumMap[instance.childrenBaseType],
      'location': _$ParameterLocationEnumMap[instance.location]!,
      'childParameters': instance.childParameters,
    };

const _$ParameterTypeEnumMap = {
  ParameterType.array: 'array',
  ParameterType.object: 'object',
  ParameterType.integer: 'integer',
  ParameterType.number: 'number',
  ParameterType.string: 'string',
  ParameterType.boolean: 'boolean',
};

const _$ParameterLocationEnumMap = {
  ParameterLocation.path: 'path',
  ParameterLocation.header: 'header',
  ParameterLocation.query: 'query',
  ParameterLocation.cookie: 'cookie',
  ParameterLocation.body: 'body',
};
