import 'package:json_annotation/json_annotation.dart';

import 'package:swagger_parser/models/swagger_document/external_documentation_object.dart';
import 'package:swagger_parser/models/swagger_document/parameter_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/request_body_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/response_or_reference_object.dart';

part 'operation_object.g.dart';

@JsonSerializable()
class OperationObject {
  OperationObject({
    required this.responses,
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
    this.parameters,
    this.requestBody,
  });

  /// A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
  final List<String>? tags;

  /// A short summary of what the operation does.
  final String? summary;

  /// A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  /// Additional external documentation for this operation.
  final ExternalDocumentationObject? externalDocs;

  /// Unique string used to identify the operation. The id MUST be unique
  /// among all operations described in the API. The operationId value is case-sensitive.
  /// Tools and libraries MAY use the operationId to uniquely identify an operation,
  /// therefore, it is RECOMMENDED to follow common programming naming conventions.
  final String? operationId;

  /// A list of parameters that are applicable for this operation.
  /// If a parameter is already defined at the Path Item, the new definition
  /// will override it but can never remove it. The list MUST NOT include
  /// duplicated parameters. A unique parameter is defined by a combination
  /// of a name and location. The list can use the Reference Object to link to
  /// parameters that are defined at the OpenAPI Object's components/parameters.
  final List<ParameterOrReferenceObject>? parameters;

  /// The request body applicable for this operation.
  /// The requestBody is only supported in HTTP methods where the
  /// HTTP 1.1 specification RFC7231 has explicitly defined semantics
  /// for request bodies. In other cases where the HTTP spec is vague,
  /// requestBody SHALL be ignored by consumers.
  final RequestBodyOrReferenceObject? requestBody;

  /// REQUIRED. The list of possible responses as they are returned from executing this operation.
  final Map<String, ResponseObject> responses;

  factory OperationObject.fromJson(Map<String, dynamic> json) =>
      _$OperationObjectFromJson(json);

  Map<String, dynamic> toJson() => _$OperationObjectToJson(this);
}
