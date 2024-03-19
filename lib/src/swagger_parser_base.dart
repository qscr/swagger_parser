import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/service/http_service.dart';
import 'package:swagger_parser/service/swagger_parser_service.dart';

class SwaggerParser {
  Future<SwaggerDoc> getDoc(String url) async {
    final httpService = HttpService();
    final swaggerService = SwaggerParserService(httpService);
    return await swaggerService.getSwaggerDoc(url);
  }
}
