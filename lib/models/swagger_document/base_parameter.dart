import 'package:swagger_parser/models/enums.dart';

/// Базовая модель параметра (и для респонса, и для реквеста)
class BaseParameter {
  BaseParameter({
    this.description,
    required this.name,
    required this.type,
    this.childParameters,
    this.nullable,
    this.format,
  });

  /// Комментарий к параметру
  String? description;

  /// Название параметра
  String name;

  /// Тип переменной
  ParameterType type;

  /// Формат переменной
  String? format;

  //Является поле обязательным
  bool? nullable;

  // Дочерние параметры
  List<BaseParameter>? childParameters;
}
