// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseParameter _$BaseParameterFromJson(Map<String, dynamic> json) =>
    BaseParameter(
      description: json['description'] as String?,
      name: json['name'] as String,
      type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
      childParameters: (json['childParameters'] as List<dynamic>?)
          ?.map((e) => BaseParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      nullable: json['nullable'] as bool?,
      format: json['format'] as String?,
    );

Map<String, dynamic> _$BaseParameterToJson(BaseParameter instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'type': _$ParameterTypeEnumMap[instance.type],
      'format': instance.format,
      'nullable': instance.nullable,
      'childParameters': instance.childParameters,
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
