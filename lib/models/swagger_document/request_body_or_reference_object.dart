import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/media_type_object.dart';
import 'package:swagger_parser/models/swagger_document/reference_object.dart';
import 'package:swagger_parser/models/swagger_document/request_body_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';

part 'request_body_or_reference_object.g.dart';

sealed class RequestBodyOrReferenceObject {
  RequestBodyOrReferenceObject();

  factory RequestBodyOrReferenceObject.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('\$ref')) {
      return ReferenceObject.fromJson(json);
    }
    return RequestBody.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    switch (this) {
      case RequestBody requestBody:
        return requestBody.toJson();
      case ReferenceObject ref:
        return ref.toJson();
    }
  }
}

extension RequestBodyOrReferenceObjectExt on RequestBodyOrReferenceObject {
  SwaggerRequestParameter? toParameter({
    required SwaggerDoc doc,
    String? key,
  }) {
    switch (this) {
      case RequestBody requestBody:
        return requestBody.toRequestParameter(
          key: key,
          doc: doc,
        );
      case ReferenceObject ref:
        return ref.toRequestParameter(
          key: key,
          doc: doc,
        );
    }
  }
}

@JsonSerializable()
class RequestBody extends RequestBodyObjectImpl
    implements RequestBodyOrReferenceObject {
  RequestBody({
    required super.content,
    super.description,
    super.required,
  });

  factory RequestBody.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyFromJson(json);
}

@JsonSerializable()
class ReferenceObject extends ReferenceObjectImpl
    implements RequestBodyOrReferenceObject {
  ReferenceObject({required super.ref});

  factory ReferenceObject.fromJson(Map<String, dynamic> json) =>
      _$ReferenceObjectFromJson(json);
}
