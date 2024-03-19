// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationObject _$OperationObjectFromJson(Map<String, dynamic> json) =>
    OperationObject(
      responses: (json['responses'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ResponseObject.fromJson(e as Map<String, dynamic>)),
      ),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      externalDocs: json['externalDocs'] == null
          ? null
          : ExternalDocumentationObject.fromJson(
              json['externalDocs'] as Map<String, dynamic>),
      operationId: json['operationId'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map((e) =>
              ParameterOrReferenceObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBody: json['requestBody'] == null
          ? null
          : RequestBodyOrReferenceObject.fromJson(
              json['requestBody'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationObjectToJson(OperationObject instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'summary': instance.summary,
      'description': instance.description,
      'externalDocs': instance.externalDocs,
      'operationId': instance.operationId,
      'parameters': instance.parameters,
      'requestBody': instance.requestBody,
      'responses': instance.responses,
    };
