import 'package:json_annotation/json_annotation.dart';

import 'package:swagger_parser/models/swagger_document/operation_object.dart';
import 'package:swagger_parser/models/swagger_document/parameter_object.dart';
import 'package:swagger_parser/models/swagger_document/parameter_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_server.dart';

part 'path_item_object.g.dart';

@JsonSerializable()
class PathItemObject {
  PathItemObject({
    this.ref,
    this.summary,
    this.description,
    this.get,
    this.put,
    this.post,
    this.delete,
    this.options,
    this.head,
    this.patch,
    this.trace,
    this.servers,
    this.parameters,
  });

  /// Allows for an external definition of this path item. The referenced structure MUST
  /// be in the format of a Path Item Object. In case a Path Item Object field appears
  /// both in the defined object and the referenced object, the behavior is undefined.
  @JsonKey(name: '\$ref')
  final String? ref;

  /// An optional, string summary, intended to apply to all operations in this path.
  final String? summary;

  /// An optional, string description, intended to apply to all operations in this path. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  final OperationObject? get;

  final OperationObject? put;

  final OperationObject? post;

  final OperationObject? delete;

  final OperationObject? options;

  final OperationObject? head;

  final OperationObject? patch;

  final OperationObject? trace;

  /// [Server Object]	An alternative server array to service all operations in this path.
  final List<SwaggerServer>? servers;

  /// [Parameter Object | Reference Object]	A list of parameters that are applicable for
  /// all the operations described under this path. These parameters can be overridden
  /// at the operation level, but cannot be removed there. The list MUST NOT include
  /// duplicated parameters. A unique parameter is defined by a combination of a name and
  /// location. The list can use the Reference Object to link to parameters that are
  /// defined at the OpenAPI Object's components/parameters.
  final List<ParameterOrReferenceObject>? parameters;

  factory PathItemObject.fromJson(Map<String, dynamic> json) =>
      _$PathItemObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PathItemObjectToJson(this);
}
