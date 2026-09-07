import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _tokenKey = 'auth_token';
  static const _nameKey = 'user_name';
  static Future<String?> token() async => (await SharedPreferences.getInstance()).getString(_tokenKey);
  static Future<String?> name() async => (await SharedPreferences.getInstance()).getString(_nameKey);
  static Future<void> save(Map data) async { final p=await SharedPreferences.getInstance(); await p.setString(_tokenKey,data['token']); await p.setString(_nameKey,data['user']['name']); }
  static Future<void> logout() async { final p=await SharedPreferences.getInstance(); await p.remove(_tokenKey); await p.remove(_nameKey); }
}