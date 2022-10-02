import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/service/get_swagger_doc.dart';

/// Checks if you are awesome. Spoiler: you are.
class SwaggerParser {
  Future<SwaggerDoc> getDoc(String url) async => await GetSwaggerDoc.getSwaggerDoc(url);
}
