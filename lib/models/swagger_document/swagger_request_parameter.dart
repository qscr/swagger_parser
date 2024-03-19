import 'package:swagger_parser/models/enums.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'swagger_request_parameter.g.dart';

/// Модель параметра из реквеста
@JsonSerializable()
class SwaggerRequestParameter extends BaseParameter {
  SwaggerRequestParameter({
    required super.type,
    required this.location,
    super.name,
    super.description,
    this.childParameters,
    super.required,
    super.format,
  });

  /// Откуда параметр (хедер, квери и т.д.)
  ParameterLocation location;

  List<SwaggerRequestParameter>? childParameters;

  factory SwaggerRequestParameter.fromJson(Map<String, dynamic> json) =>
      _$SwaggerRequestParameterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SwaggerRequestParameterToJson(this);
}
