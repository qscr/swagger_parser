import 'dart:convert';

import 'package:http/http.dart' as http;

class GetResponse {
  static Future<Map<String, dynamic>> getResponse(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    return responseMap;
  }
}
