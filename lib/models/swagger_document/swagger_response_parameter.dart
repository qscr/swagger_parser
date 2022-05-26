import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';

part 'swagger_response_parameter.g.dart';

/// Модель параметра из респонса
@JsonSerializable()
class SwaggerResponseParameter extends BaseParameter {
  SwaggerResponseParameter({
    required super.name,
    required super.type,
    super.description,
    super.childParameters,
    super.nullable,
    super.format,
  });

  factory SwaggerResponseParameter.fromJson(Map<String, dynamic> json) =>
      _$SwaggerResponseParameterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SwaggerResponseParameterToJson(this);
}
