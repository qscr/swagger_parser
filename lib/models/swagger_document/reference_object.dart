import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/request_body_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/response_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/schema_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

part 'reference_object.g.dart';

@JsonSerializable()
class ReferenceObjectImpl {
  ReferenceObjectImpl({
    required this.ref,
  });

  /// REQUIRED
  @JsonKey(name: '\$ref')
  final String ref;

  String get refName => ref.split('/').last;

  factory ReferenceObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$ReferenceObjectImplFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceObjectImplToJson(this);

  SwaggerRequestParameter? toRequestParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    doc.cachedRequestParameters[refName] = SwaggerRequestParameter(
      name: refName,
      type: ParameterType.object,
      location: ParameterLocation.body,
    );
    final objects = [
      doc.components?.schemas?[refName]?.toRequestParameter(
        key: refName,
        doc: doc,
      ),
      doc.components?.requestBodies?[refName]?.toParameter(
        key: refName,
        doc: doc,
      ),
      // doc.components?.responses?[ref]?.toParameter(doc: doc),
    ].whereNotNull();
    final object = objects.firstOrNull;
    if (object != null) {
      doc.cachedRequestParameters[refName] = object;
      return object;
    }
    return null;
  }

  SwaggerResponseParameter? toResponseParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    doc.cachedResponseParameters[refName] = SwaggerResponseParameter(
      name: refName,
      type: ParameterType.object,
    );
    final objects = [
      doc.components?.schemas?[refName]?.toResponseParameter(
        key: refName,
        doc: doc,
      ),
      // doc.components?.responses?[ref]?.toParameter(doc: doc),
    ].whereNotNull();
    final object = objects.firstOrNull;
    if (object != null) {
      doc.cachedResponseParameters[refName] = object;
      return object;
    }
    return null;
  }
}
