import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/swagger_request_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';

/// Модель метода (операции)
class SwaggerMethod {
  SwaggerMethod({
    required this.name,
    required this.type,
    this.description,
    this.requestParameters,
    this.responseParameters,
  });

  /// Эндпоинт метода
  String name;

  /// Тип метода (get, post и т.д.)
  MethodType type;

  /// Комментарий к методу
  String? description;

  /// Параметры реквеста
  List<SwaggerRequestParameter>? requestParameters;

  /// Параметры респонса
  List<SwaggerResponseParameter>? responseParameters;
}
