import 'package:swagger_parser/models/swagger_document/swagger_method.dart';

class SwaggerDoc {
  SwaggerDoc(this.methods);
  
  List<SwaggerMethod> methods;
}