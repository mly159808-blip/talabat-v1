import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const base = "https://api-production-b7cf.up.railway.app/api";

  static Future<dynamic> get(String path) async {
    final r = await http.get(Uri.parse(base + path));
    if (r.statusCode >= 400) throw Exception("API ${r.statusCode}");
    return jsonDecode(r.body);
  }

  static Future<dynamic> post(String path, Map body, {String? token}) async {
    final r = await http.post(
      Uri.parse(base + path),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    if (r.statusCode >= 400) {
      final data = jsonDecode(r.body);
      throw Exception(data["message"] ?? "خطأ");
    }
    return jsonDecode(r.body);
  }
}
