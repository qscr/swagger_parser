import '../models/enums.dart';

/// Методы для работы с enum
class EnumsHelper {
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
