import 'package:swagger_parser/models/swagger_document/base_parameter.dart';

/// Модель параметра из респонса
class SwaggerResponseParameter extends BaseParameter {
  SwaggerResponseParameter({
    required super.name,
    required super.type,
    super.description,
  });
}
