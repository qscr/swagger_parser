// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwaggerDoc _$SwaggerDocFromJson(Map<String, dynamic> json) => SwaggerDoc(
      (json['methods'] as List<dynamic>)
          .map((e) => SwaggerMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SwaggerDocToJson(SwaggerDoc instance) =>
    <String, dynamic>{
      'methods': instance.methods,
    };
