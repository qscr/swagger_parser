import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';

part 'base_parameter.g.dart';

/// Базовая модель параметра (и для респонса, и для реквеста)
@JsonSerializable()
class BaseParameter {
  BaseParameter({
    this.description,
    this.name,
    required this.type,
    this.required,
    this.format,
    this.childrenBaseType,
  });

  BaseParameter.empty()
      : name = '',
        type = ParameterType.object;

  /// Комментарий к параметру
  String? description;

  /// Название параметра
  String? name;

  /// Тип параметра
  ParameterType type;

  /// Формат переменной
  String? format;

  /// Является поле обязательным
  bool? required;

  /// Параметр, когда массив состоит из примитивных типов
  ParameterType? childrenBaseType;

  factory BaseParameter.fromJson(Map<String, dynamic> json) =>
      _$BaseParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BaseParameterToJson(this);

  @override
  String toString() {
    return [type.name, name]
        .whereNotNull()
        .where((element) => element.isNotEmpty)
        .join(' ');
  }
}
