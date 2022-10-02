import 'package:swagger_parser/swagger_parser.dart';

void main() async {
  final parser = SwaggerParser();
  var url = "http://gkh-test.bars-open.ru/test-rt/swagger/docs/v1";
  final doc = await parser.getDoc(url);
  print(doc);
}
