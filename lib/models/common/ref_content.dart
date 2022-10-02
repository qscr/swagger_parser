import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';

/// Контент ссылки на модель
class RefContent {
  RefContent({
    this.name,
    this.childProperties,
    required this.parentType,
    this.parentDescription,
  });

  /// Название родительского параметра
  String? name;

  /// Параметры рефки сформированные в модель
  List<BaseParameter>? childProperties;

  /// Тип родительского параметра
  ParameterType parentType;

  /// Описание родительского параметра
  String? parentDescription;
}
