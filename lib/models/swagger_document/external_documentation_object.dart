import 'package:json_annotation/json_annotation.dart';

part 'external_documentation_object.g.dart';

@JsonSerializable()
class ExternalDocumentationObject {
  ExternalDocumentationObject({
    required this.title,
    this.description,
  });

  /// REQUIRED. The URL for the target documentation. Value MUST be in the format of a URL.
  final String title;

  /// A short description of the target documentation. CommonMark syntax MAY be used for rich text representation.
  final String? description;

  factory ExternalDocumentationObject.fromJson(Map<String, dynamic> json) =>
      _$ExternalDocumentationObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalDocumentationObjectToJson(this);
}
