import 'package:json_annotation/json_annotation.dart';
import 'package:swagger_parser/models/swagger_document/swagger_method.dart';

part 'swagger_doc.g.dart';

@JsonSerializable()
class SwaggerDoc {
  SwaggerDoc(this.methods);

  List<SwaggerMethod> methods;

  factory SwaggerDoc.fromJson(Map<String, dynamic> json) => _$SwaggerDocFromJson(json);

  Map<String, dynamic> toJson() => _$SwaggerDocToJson(this);
}
