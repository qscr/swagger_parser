// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseParameter _$BaseParameterFromJson(Map<String, dynamic> json) =>
    BaseParameter(
      description: json['description'] as String?,
      name: json['name'] as String?,
      type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
      required: json['required'] as bool?,
      format: json['format'] as String?,
      childrenBaseType:
          $enumDecodeNullable(_$ParameterTypeEnumMap, json['childrenBaseType']),
    );

Map<String, dynamic> _$BaseParameterToJson(BaseParameter instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'type': _$ParameterTypeEnumMap[instance.type]!,
      'format': instance.format,
      'required': instance.required,
      'childrenBaseType': _$ParameterTypeEnumMap[instance.childrenBaseType],
    };

const _$ParameterTypeEnumMap = {
  ParameterType.array: 'array',
  ParameterType.object: 'object',
  ParameterType.integer: 'integer',
  ParameterType.number: 'number',
  ParameterType.string: 'string',
  ParameterType.boolean: 'boolean',
};
