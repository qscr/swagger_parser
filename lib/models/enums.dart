enum ParameterType {
  array(
    [
      'array',
    ],
    false,
  ),
  object(
    [
      'object',
    ],
    false,
  ),
  integer(
    [
      'integer',
      'int32',
      'int64',
    ],
    true,
  ),
  number(
    [
      'number',
      'float',
      'double',
    ],
    true,
  ),
  string(
    [
      'string',
      'byte',
      'binary',
      'date',
      'date-time',
      'password',
    ],
    true,
  ),
  boolean(
    [
      'boolean',
    ],
    true,
  );

  const ParameterType(
    this.formats,
    this.isPrimitive,
  );

  final List<String> formats;

  final bool isPrimitive;

  static Map<String, ParameterType> parametersMap = {};

  static init() {
    for (var value in values) {
      for (var format in value.formats) {
        parametersMap[format] = value;
      }
    }
  }

  factory ParameterType.fromString(String value) {
    if (parametersMap.isEmpty) {
      init();
    }
    return parametersMap[value]!;
  }
}

enum ParameterLocation {
  path(['path']),
  header(['header']),
  query(['query']),
  cookie(['cookie']),
  body(['body']);

  const ParameterLocation(this.formats);

  final List<String> formats;

  static Map<String, ParameterLocation> parametersMap = {};

  static init() {
    for (var value in values) {
      for (var format in value.formats) {
        parametersMap[format] = value;
      }
    }
  }

  factory ParameterLocation.fromString(String value) {
    if (parametersMap.isEmpty) {
      init();
    }
    return parametersMap[value]!;
  }
}

enum MethodType {
  get,
  post,
  put,
  delete,
}
