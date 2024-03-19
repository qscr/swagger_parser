import 'package:swagger_parser/models/swagger_document/operation_object.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_wrapper/swagger_wrapper_method.dart';

class SwaggerWrapperPath {
  final String path;

  final String? fullPath;

  final List<SwaggerWrapperMethod> methods;

  SwaggerWrapperPath({
    required this.path,
    this.fullPath,
    this.methods = const [],
  });

  @override
  String toString() => path;

  factory SwaggerWrapperPath.fromSwaggerDoc({
    required SwaggerDoc doc,
    required String path,
  }) {
    final pathObject = doc.paths[path];
    if (pathObject == null) {
      throw Exception();
    }
    final fullPath =
        doc.servers.isNotEmpty ? doc.servers.first.url + path : null;
    final operations = {
      SwaggerWrapperMethodType.delete: pathObject.delete,
      SwaggerWrapperMethodType.get: pathObject.get,
      SwaggerWrapperMethodType.post: pathObject.post,
      SwaggerWrapperMethodType.put: pathObject.put,
      SwaggerWrapperMethodType.patch: pathObject.patch,
      SwaggerWrapperMethodType.head: pathObject.head,
      SwaggerWrapperMethodType.options: pathObject.options,
      SwaggerWrapperMethodType.trace: pathObject.trace,
    }..removeWhere((key, value) => value == null);
    final methods = operations.entries
        .map(
          (e) => SwaggerWrapperMethod.fromSwaggerDoc(
            type: e.key,
            doc: doc,
            operation: e.value!,
          ),
        )
        .toList();
    return SwaggerWrapperPath(
      path: path,
      fullPath: fullPath,
      methods: methods,
    );
  }
}
