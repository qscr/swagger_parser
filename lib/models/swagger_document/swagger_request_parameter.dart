import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';

/// Модель параметра из реквеста
class SwaggerRequestParameter extends BaseParameter {
  SwaggerRequestParameter({
    required super.name,
    required super.type,
    required this.location,
    super.description,
    super.childParameters,
    super.nullable,
    super.format,
  });

  /// Откуда параметр (хедер, квери и т.д.)
  ParameterLocation location;
}
