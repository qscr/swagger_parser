import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_wrapper/swagger_wrapper_path.dart';

class SwaggerWrapper {
  final List<SwaggerWrapperPath> paths;

  SwaggerWrapper({
    required this.paths,
  });

  factory SwaggerWrapper.fromSwaggerDoc(SwaggerDoc doc) {
    final paths = doc.paths.entries
        .map(
          (entry) => SwaggerWrapperPath.fromSwaggerDoc(
            doc: doc,
            path: entry.key,
          ),
        )
        .toList();
    return SwaggerWrapper(paths: paths);
  }
}
