import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/parameter_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/request_body_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/response_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';

part 'components_object.g.dart';

@JsonSerializable()
class ComponentsObject {
  ComponentsObject({
    this.schemas,
    this.parameters,
    this.requestBodies,
    this.responses,
  });

  final Map<String, SchemaOrReferenceObject>? schemas;

  final Map<String, ResponseOrReferenceObject>? responses;

  final Map<String, ParameterOrReferenceObject>? parameters;

  final Map<String, RequestBodyOrReferenceObject>? requestBodies;

  factory ComponentsObject.fromJson(Map<String, dynamic> json) =>
      _$ComponentsObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsObjectToJson(this);
}
