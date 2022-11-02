import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';

part 'base_parameter.g.dart';

/// Базовая модель параметра (и для респонса, и для реквеста)
@JsonSerializable()
class BaseParameter {
  BaseParameter({
    this.description,
    required this.name,
    required this.type,
    this.childParameters,
    this.nullable,
    this.format,
    this.childrenBaseType,
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

  /// Параметр, когда массив состоит из примитивных типов
  ParameterType? childrenBaseType;

  factory BaseParameter.fromJson(Map<String, dynamic> json) => _$BaseParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BaseParameterToJson(this);

  @override
  String toString() {
    return '$type $name';
  }
}
