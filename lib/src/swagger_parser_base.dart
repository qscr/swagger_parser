// TODO: Put public facing types in this file.

import 'package:swagger_parser/service/get_response.dart';
import 'package:swagger_parser/service/get_swagger_doc.dart';

/// Checks if you are awesome. Spoiler: you are.
class SwaggerParser {
  Future<dynamic> getDoc() async => await GetSwaggerDoc.getSwaggerDoc();
}
