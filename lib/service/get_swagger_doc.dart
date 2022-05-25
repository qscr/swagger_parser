import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_method.dart';
import 'package:swagger_parser/service/get_response.dart';

import '../models/common/ref_content.dart';
import '../models/enums.dart';
import '../models/swagger_document/swagger_request_parameter.dart';

class GetSwaggerDoc {
  static const String pathsKey = "paths";
  static const String componentsKey = "components";
  static const String summaryKey = "summary";
  static const String requestBodyKey = "requestBody";
  static const String contentKey = "content";
  static const String schemaKey = "schema";
  static const String refKey = "\$ref";
  static const String typeKey = "type";
  static const String descriptionKey = "description";
  static const String propertiesKey = "properties";
  static const String itemsKey = "items";
  static const String nullableKey = "nullable";
  static const String parametersKey = "parameters";
  static const String nameKey = "name";
  static const String inKey = "in";
  static const String formatKey = "format";

  static Future<SwaggerDoc> getSwaggerDoc() async {
    final responseMap = await GetResponse.getResponse();
    final paths = responseMap[pathsKey];

    var swaggerMethods = List<SwaggerMethod>.empty(growable: true);

    if (paths is Map<String, dynamic>) {
      final content = responseMap[componentsKey];
      if (content is! Map<String, dynamic>) {
        throw Error();
      }

      for (var path in paths.entries) {
        final methods = path.value;

        if (methods is! Map<String, dynamic>) {
          throw Error();
        }

        for (var method in methods.entries) {
          var swaggerMethod = SwaggerMethod(
            name: path.key,
            type: getMethodType(method.key),
            requestParameters: [],
          );

          final methodValues = method.value;

          if (methodValues == null && methodValues is! Map<String, dynamic>) {
            throw Error();
          }

          swaggerMethod.description = methodValues[summaryKey];

          var parametersMap = methodValues[parametersKey];

          if (parametersMap != null && parametersMap is List<Map<String, dynamic>>) {
            for (var parameter in parametersMap) {
              var parameterSchemaMap = parameter[schemaKey];

              if (parameterSchemaMap == null && parameterSchemaMap is! Map<String, dynamic>) {
                throw Error();
              }

              var typeStr = parameterSchemaMap[typeKey]?.toString();
              var itemsMap = _getParameterItems(parameterSchemaMap, responseMap);

              var requestParameter = SwaggerRequestParameter(
                name: parameter[nameKey],
                type: getParameterType(typeStr ?? itemsMap![typeKey]),
                location: getParameterLocation(parameter[inKey]),
                description: parameter[descriptionKey],
                format: parameterSchemaMap[formatKey],
              );

              var parameterItemMap = parameterSchemaMap[itemsKey];

              swaggerMethod.requestParameters?.add(requestParameter);
            }
          }

          var requestMap = methodValues[requestBodyKey];

          if (requestMap != null && requestMap is Map<String, dynamic>) {
            var contentMap = requestMap[contentKey];

            if (contentMap is! Map<String, dynamic>) {
              throw Error();
            }

            var schemaMap = contentMap.entries.first.value;

            if (schemaMap is! Map<String, dynamic>) {
              throw Error();
            }

            var schema = schemaMap[schemaKey];

            if (schema is! Map<String, dynamic>) {
              throw Error();
            }

            var refContent = _getRefContent(schema, responseMap);
            var contentProperties = refContent.content;

            if (contentProperties == null && contentProperties is! Map<String, dynamic>) {
              throw Error();
            }

            var requestParameter = SwaggerRequestParameter(
                name: refContent.name,
                type: getParameterType(contentProperties[typeKey].toString()),
                location: ParameterLocation.body,
                description: contentProperties[descriptionKey]);

            var childProperties = contentProperties[propertiesKey];
            if (childProperties == null && childProperties is! Map<String, dynamic>) {
              throw Error();
            }

            requestParameter.childParameters = _getParameters(childProperties, responseMap);
            swaggerMethod.requestParameters?.add(requestParameter);

            for (var element in contentProperties.entries) {}
          }

          swaggerMethods.add(swaggerMethod);
        }
      }
    }

    return SwaggerDoc(swaggerMethods);
  }

  static List<BaseParameter>? _getChildProperties(
      Map<String, dynamic> schemaMap, Map<String, dynamic> responseMap) {
    var typeStr = schemaMap[typeKey]?.toString();
    var refStr = schemaMap[refKey]?.toString();
    var itemsMap = schemaMap[itemsKey];

    if (refStr == null) {
      if (itemsMap != null && itemsMap is Map<String, dynamic>) {
        refStr = itemsMap[refKey]?.toString();
      }
    }

    if (refStr != null) {
      var refContent = _getRefContentParameters(refStr.split('/').skip(1).toList(), responseMap);

      if (refContent == null && refContent is! Map<String, dynamic>) {
        throw Error();
      }

      var childProperties = refContent[propertiesKey];
      if (childProperties == null && childProperties is! Map<String, dynamic>) {
        throw Error();
      }

      var childParameters = _getParameters(childProperties, responseMap);

      return childParameters;
    }
  }

  static MethodType getMethodType(String key) {
    return MethodType.values.firstWhere((e) => e.name.toLowerCase() == key.toLowerCase());
  }

  static ParameterType getParameterType(String key) {
    return ParameterType.values.firstWhere((e) => e.name.toLowerCase() == key.toLowerCase());
  }

  static ParameterLocation getParameterLocation(String key) {
    return ParameterLocation.values.firstWhere((e) => e.name.toLowerCase() == key.toLowerCase());
  }

  static Map<String, dynamic>? _getRefContentParameters(
      List<String> refs, Map<String, dynamic> response) {
    if (refs.isEmpty) {
      return null;
    }
    if (refs.length == 1) {
      return response[refs.first];
    }
    return _getRefContentParameters(refs.skip(1).toList(), response[refs.first]);
  }

  static Map<String, dynamic>? _getParameterItems(
      Map<String, dynamic> dict, Map<String, dynamic> responseMap) {
    var ref = dict[refKey]?.toString();
    if (ref != null) {
      return _getRefContentParameters(ref.split("/").skip(1).toList(), responseMap);
    }

    var itemsMap = dict[itemsKey];
    if (itemsMap == null && itemsMap is! Map<String, dynamic>) {
      return null;
    }

    ref = itemsMap[refKey]?.toString();
    if (ref != null) {
      return _getRefContentParameters(ref.split("/").skip(1).toList(), responseMap);
    }

    return itemsMap;
  }

  static RefContent _getRefContent(Map<String, dynamic> dict, Map<String, dynamic> responseMap) {
    var ref = dict[refKey] ?? "";

    var refParts = ref.split('/').skip(1).toList();

    return RefContent(
        name: refParts.last, content: _getRefContentParameters(refParts, responseMap));
  }

  static List<BaseParameter>? _getParameters(
      Map<String, dynamic> parametersMap, Map<String, dynamic> responseMap) {
    var parameters = List<BaseParameter>.empty(growable: true);

    for (var parameter in parametersMap.entries) {
      var parameterValue = parameter.value;

      if (parameterValue is! Map<String, dynamic>) {
        throw Error();
      }

      var type = parameterValue[typeKey].toString();
      var parameterType = getParameterType(type);
      var baseParameter = BaseParameter(name: parameter.key, type: parameterType);

      if (parameterType == ParameterType.array || parameterType == ParameterType.object) {
        var itemsMap = parameterValue[itemsKey];

        if (itemsMap == null && itemsMap is! Map<String, dynamic>) {
          throw Error();
        }

        var refContent = _getRefContent(itemsMap, responseMap);
        var contentProperties = refContent.content;

        if (contentProperties == null && contentProperties is! Map<String, dynamic>) {
          throw Error();
        }

        var childProperties = contentProperties[propertiesKey];
        if (childProperties == null && childProperties is! Map<String, dynamic>) {
          throw Error();
        }

        var childParametersMap = _getParameters(childProperties, responseMap);
        baseParameter.childParameters = childParametersMap;
      }

      baseParameter.description = parameterValue[descriptionKey]?.toString();
      baseParameter.nullable = parameterValue[nullableKey];

      parameters.add(baseParameter);
    }

    return parameters;
  }
}
