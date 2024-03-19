import 'package:swagger_parser/swagger_parser.dart';

void main() async {
  final parser = SwaggerParser();
  var url = "http://rdp.a2soft.ru:9040/swagger/1.1.170/swagger.json";
  final doc = await parser.getDoc(url);
  print(doc);
}
