// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsObject _$ComponentsObjectFromJson(Map<String, dynamic> json) =>
    ComponentsObject(
      schemas: (json['schemas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, SchemaOrReferenceObject.fromJson(e as Map<String, dynamic>)),
      ),
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, ParameterOrReferenceObject.fromJson(e as Map<String, dynamic>)),
      ),
      requestBodies: (json['requestBodies'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k,
            RequestBodyOrReferenceObject.fromJson(e as Map<String, dynamic>)),
      ),
      responses: (json['responses'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, ResponseOrReferenceObject.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ComponentsObjectToJson(ComponentsObject instance) =>
    <String, dynamic>{
      'schemas': instance.schemas,
      'responses': instance.responses,
      'parameters': instance.parameters,
      'requestBodies': instance.requestBodies,
    };
