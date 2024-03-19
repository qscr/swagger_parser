// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_response_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerResponseParameter _$SwaggerResponseParameterFromJson(
        Map<String, dynamic> json) =>
    SwaggerResponseParameter(
      name: json['name'] as String?,
      type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
      childParameters: (json['childParameters'] as List<dynamic>?)
          ?.map((e) =>
              SwaggerResponseParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      required: json['required'] as bool?,
      format: json['format'] as String?,
    )..childrenBaseType =
        $enumDecodeNullable(_$ParameterTypeEnumMap, json['childrenBaseType']);

Map<String, dynamic> _$SwaggerResponseParameterToJson(
        SwaggerResponseParameter instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'type': _$ParameterTypeEnumMap[instance.type]!,
      'format': instance.format,
      'required': instance.required,
      'childrenBaseType': _$ParameterTypeEnumMap[instance.childrenBaseType],
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
