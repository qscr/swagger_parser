import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/media_type_object.dart';
import 'package:swagger_parser/models/swagger_document/reference_object.dart';
import 'package:swagger_parser/models/swagger_document/response_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

part 'response_or_reference_object.g.dart';

sealed class ResponseOrReferenceObject {
  ResponseOrReferenceObject();

  factory ResponseOrReferenceObject.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('\$ref')) {
      return ReferenceObject.fromJson(json);
    }
    return ResponseObject.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    switch (this) {
      case ResponseObject response:
        return response.toJson();
      case ReferenceObject ref:
        return ref.toJson();
    }
  }
}

extension ResponseOrReferenceObjectExt on ResponseOrReferenceObject {
  SwaggerResponseParameter? toResponseParameter({
    required SwaggerDoc doc,
  }) {
    switch (this) {
      case ResponseObject resp:
        return resp.toResponseParameter(doc: doc);
      case ReferenceObject ref:
        return ref.toResponseParameter(doc: doc);
    }
  }
}

@JsonSerializable()
class ResponseObject extends ResponseObjectImpl
    implements ResponseOrReferenceObject {
  ResponseObject({
    super.content,
    required super.description,
  });

  factory ResponseObject.fromJson(Map<String, dynamic> json) =>
      _$ResponseObjectFromJson(json);
}

@JsonSerializable()
class ReferenceObject extends ReferenceObjectImpl
    implements ResponseOrReferenceObject {
  ReferenceObject({required super.ref});

  factory ReferenceObject.fromJson(Map<String, dynamic> json) =>
      _$ReferenceObjectFromJson(json);
}
