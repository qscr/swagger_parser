import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';

class RefContent {
  RefContent({
    this.name,
    this.childProperties,
    required this.parentType,
    this.parentDescription,
  });

  //название родительского параметра
  String? name;

  //Параметры рефки сформированные в модель
  List<BaseParameter>? childProperties;

  //Тип родительского параметра
  ParameterType parentType;

  //описание родительского параметра
  String? parentDescription;
}
