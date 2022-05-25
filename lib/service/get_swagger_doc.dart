import 'package:swagger_parser/helpers/custom_exception.dart';
import 'package:swagger_parser/models/swagger_document/base_parameter.dart';
import 'package:swagger_parser/models/swagger_document/swagger_doc.dart';
import 'package:swagger_parser/models/swagger_document/swagger_method.dart';
import 'package:swagger_parser/models/swagger_document/swagger_response_parameter.dart';
import 'package:swagger_parser/service/get_response.dart';

import '../models/common/ref_content.dart';
import '../models/enums.dart';
import '../models/swagger_document/swagger_request_parameter.dart';

class GetSwaggerDoc {
  static const String pathsKey = "paths";
  static const String componentsKey = "components";
  static const String summaryKey = "summary";
  static const String requestBodyKey = "requestBody";
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
  static const String responsesKey = "responses";
  static const String successResponseKey = "200";

  static Future<SwaggerDoc> getSwaggerDoc(String url) async {
    final mainMap = await GetResponse.getResponse(url);
    final pathsMap = mainMap[pathsKey];
    List<SwaggerMethod> swaggerMethods = [];

    if (pathsMap is! Map<String, dynamic>) {
      throw Error();
    }

    for (var path in pathsMap.entries) {
      final methodsMap = path.value;

      if (methodsMap is! Map<String, dynamic>) {
        throw Error();
      }

      for (var method in methodsMap.entries) {
        var swaggerMethod = SwaggerMethod(
          name: path.key,
          type: getMethodType(method.key),
        );

        final methodContentMap = method.value;

        if (methodContentMap == null && methodContentMap is! Map<String, dynamic>) {
          throw Error();
        }

        swaggerMethod.description = methodContentMap[summaryKey];
        swaggerMethod.requestParameters =
            _getSwaggerRequestParameters(methodContentMap: methodContentMap, mainMap: mainMap);
        swaggerMethod.responseParameters =
            _getSwaggerResponseParameters(methodContentMap: methodContentMap, mainMap: mainMap);

        swaggerMethods.add(swaggerMethod);
      }
    }

    return SwaggerDoc(swaggerMethods);
  }

  ///Получение узла schema
  static Map<String, dynamic>? _getSchemaMap(Map<String, dynamic> dictionary) {
    for (var element in dictionary.entries) {
      if (element.key == schemaKey) {
        var schemaMap = element.value;
        return schemaMap is Map<String, dynamic> ? schemaMap : null;
      }

      var nextMap = element.value;
      if (nextMap is! Map<String, dynamic>) {
        continue;
      }

      return _getSchemaMap(nextMap);
    }
  }

  ///Преобразование параметрова из респонса в список моделей
  ///
  ///[methodContentMap] узел параметров метода
  ///[mainMap] основной узел
  static List<SwaggerResponseParameter>? _getSwaggerResponseParameters({
    required Map<String, dynamic> methodContentMap,
    required Map<String, dynamic> mainMap,
  }) {
    List<SwaggerResponseParameter>? responseParameters = [];
    var responseMap = methodContentMap[responsesKey];

    if (responseMap != null && responseMap is Map<String, dynamic>) {
      var successResponseMap = responseMap[successResponseKey];

      if (successResponseMap == null && successResponseMap is! Map<String, dynamic>) {
        return null;
      }

      var schemaMap = _getSchemaMap(successResponseMap);

      if (schemaMap == null) {
        return null;
      }

      var refProperties = _getChildProperties(schemaMap: schemaMap, mainMap: mainMap);

      var responseParameter = SwaggerResponseParameter(
        name: refProperties.name.toString(),
        type: refProperties.parentType,
        description: refProperties.parentDescription,
        childParameters: refProperties.childProperties,
      );

      responseParameters.add(responseParameter);
    }

    return responseParameters.isEmpty ? null : responseParameters;
  }

  /// Преобразование параметров из реквеста в список моделей
  ///
  /// [methodContentMap] узел параметров метода
  /// [mainMap] основной узел
  static List<SwaggerRequestParameter>? _getSwaggerRequestParameters({
    required Map<String, dynamic> methodContentMap,
    required Map<String, dynamic> mainMap,
  }) {
    List<SwaggerRequestParameter> requestParameters = [];
    var parametersMap = methodContentMap[parametersKey];

    if (parametersMap != null && parametersMap is List<Map<String, dynamic>>) {
      for (var parameter in parametersMap) {
        var parameterSchemaMap = _getSchemaMap(parameter);

        if (parameterSchemaMap == null) {
          throw Error();
        }

        var refProperties = _getChildProperties(schemaMap: parameterSchemaMap, mainMap: mainMap);

        var requestParameter = SwaggerRequestParameter(
          name: parameter[nameKey],
          type: refProperties.parentType,
          location: getParameterLocation(parameter[inKey]),
          description: parameter[descriptionKey],
          format: parameterSchemaMap[formatKey],
          childParameters: refProperties.childProperties,
        );
        requestParameters.add(requestParameter);
      }
    }

    var requestMap = methodContentMap[requestBodyKey];

    if (requestMap != null && requestMap is Map<String, dynamic>) {
      var schemaMap = _getSchemaMap(requestMap);

      if (schemaMap == null) {
        throw Error();
      }

      var refProperties = _getChildProperties(schemaMap: schemaMap, mainMap: mainMap);

      var requestParameter = SwaggerRequestParameter(
        name: refProperties.name.toString(),
        type: refProperties.parentType,
        location: ParameterLocation.body,
        description: refProperties.parentDescription,
        childParameters: refProperties.childProperties,
      );

      requestParameters.add(requestParameter);
    }

    return requestParameters.isEmpty ? null : requestParameters;
  }

  ///получение моделей дочерних свойств параметра
  static RefContent _getChildProperties({
    required Map<String, dynamic> schemaMap,
    required Map<String, dynamic> mainMap,
  }) {
    var typeStr = schemaMap[typeKey]?.toString();
    var itemsMap = schemaMap[itemsKey];
    var refStr = schemaMap[refKey] ??
        (itemsMap != null && itemsMap is Map<String, dynamic>
            ? itemsMap[refKey]?.toString()
            : null);

    if (refStr != null) {
      var refParts = refStr.split('/').skip(1).toList();
      var refContent = _getRefContentParameters(refParts, mainMap);

      if (refContent == null && refContent is! Map<String, dynamic>) {
        throw Error();
      }

      var childProperties = refContent[propertiesKey];
      if (childProperties == null && childProperties is! Map<String, dynamic>) {
        return RefContent(parentType: getParameterType(typeStr ?? refContent[typeKey].toString()));
      }

      var childParameters = _getParameters(childProperties, mainMap);

      return RefContent(
        childProperties: childParameters,
        parentType: getParameterType(typeStr ?? refContent[typeKey].toString()),
        name: refParts.last,
        parentDescription: refContent[descriptionKey]?.toString(),
      );
    }

    if (itemsMap != null && itemsMap is Map<String, dynamic>) {
      var baseParameter = BaseParameter(
        name: itemsMap[nameKey] ?? "${typeStr}Item",
        type: getParameterType(itemsMap[typeKey].toString()),
        format: itemsMap[formatKey]?.toString(),
      );

      return RefContent(
          childProperties: [baseParameter], parentType: getParameterType(typeStr.toString()));
    }

    return RefContent(parentType: getParameterType(typeStr.toString()));
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

  static List<BaseParameter>? _getParameters(
      Map<String, dynamic> parametersMap, Map<String, dynamic> responseMap) {
    var parameters = List<BaseParameter>.empty(growable: true);

    for (var parameter in parametersMap.entries) {
      var propertyMap = parameter.value;

      if (propertyMap is! Map<String, dynamic>) {
        throw Error();
      }

      var refProperties = _getChildProperties(schemaMap: propertyMap, mainMap: responseMap);
      var baseParameter = BaseParameter(
        name: parameter.key,
        type: refProperties.parentType,
        description: propertyMap[descriptionKey]?.toString(),
        nullable: propertyMap[nullableKey],
        childParameters: refProperties.childProperties,
        format: propertyMap[formatKey],
      );
      parameters.add(baseParameter);
    }

    return parameters;
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
}
