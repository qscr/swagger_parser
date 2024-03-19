import 'package:collection/collection.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/operation_object.dart';
import 'package:swagger_parser/models/swagger_document/parameter_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/request_body_or_reference_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

enum SwaggerWrapperMethodType {
  get,
  put,
  post,
  delete,
  options,
  head,
  patch,
  trace,
}

class SwaggerWrapperMethod {
  final SwaggerWrapperMethodType type;

  final List<SwaggerRequestParameter> requestParameters;

  final List<SwaggerResponseParameter> responseParameters;

  SwaggerWrapperMethod({
    required this.type,
    this.requestParameters = const [],
    this.responseParameters = const [],
  });

  @override
  String toString() => type.name;

  factory SwaggerWrapperMethod.fromSwaggerDoc({
    required SwaggerWrapperMethodType type,
    required SwaggerDoc doc,
    required OperationObject operation,
  }) {
    final List<SwaggerRequestParameter> requestParams = [];
    final List<SwaggerResponseParameter> responseParams = [];

    final reqBody = operation.requestBody;
    if (reqBody != null) {
      final reqParam = reqBody.toParameter(
        doc: doc,
      );
      if (reqParam != null) {
        requestParams.add(reqParam);
      }
    }

    if (operation.parameters != null && operation.parameters!.isNotEmpty) {
      requestParams.addAll(
        operation.parameters!.map(
          (e) {
            final reqP = e.toParameter(
              doc: doc,
            );
            if (reqP != null) {
              return reqP;
            }
          },
        ).whereNotNull(),
      );
    }

    if (operation.responses.entries.isNotEmpty) {
      final entry = operation.responses.entries.first;
      final respP = entry.value.toResponseParameter(doc: doc);
      if (respP != null) {
        responseParams.add(respP);
      }
    }
    return SwaggerWrapperMethod(
      type: type,
      requestParameters: requestParams,
      responseParameters: responseParams,
    );
  }
}
