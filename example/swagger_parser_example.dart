import 'package:swagger_parser/swagger_parser.dart';

void main() {
  final parser = SwaggerParser();
  var url = "http://213.226.112.183:8090/swagger/v1/swagger.json";
  parser.getDoc(url);
}
