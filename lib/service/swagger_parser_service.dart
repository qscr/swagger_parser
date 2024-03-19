import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_wrapper/swagger_wrapper.dart';
import 'package:swagger_parser/service/http_service.dart';

class SwaggerParserService {
  SwaggerParserService(this.httpService);

  final HttpService httpService;

  String pathsKey = "paths";
  String componentsKey = "components";
  String summaryKey = "summary";
  String requestBodyKey = "requestBody";
  String schemaKey = "schema";
  String refKey = "\$ref";
  String typeKey = "type";
  String descriptionKey = "description";
  String propertiesKey = "properties";
  String itemsKey = "items";
  String nullableKey = "nullable";
  String parametersKey = "parameters";
  String nameKey = "name";
  String inKey = "in";
  String formatKey = "format";
  String responsesKey = "responses";
  String successResponseKey = "200";

  Future<SwaggerDoc> getSwaggerDoc(String url) async {
    final openapiJSON = await httpService.get(url);

    final openapiModel = SwaggerDoc.fromJson(openapiJSON);

    final wrapperModel = SwaggerWrapper.fromSwaggerDoc(openapiModel);

    print(wrapperModel);

    throw Exception();
  }
}
