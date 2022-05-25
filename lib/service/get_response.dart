import 'dart:convert';

import 'package:http/http.dart' as http;

class GetResponse {
  static Future<Map<String, dynamic>> getResponse() async {
    final url = "http://213.226.112.183:8090/swagger/v1/swagger.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    return responseMap;
  }
}
