import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ApiService {
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {'success': true, 'token': data['token'], 'user': data['user']};
    } else {
      return {'success': false};
    }
  }
  static Future<List<Map<String, dynamic>>> fetchOpportunities() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/api/opportunity'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch opportunities');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchApplications(String userId, String role) async {
    final response = await http.get(Uri.parse('$apiBaseUrl/api/applications?userId=$userId&role=$role'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch applications');
    }
  }
  // Add other API methods (register, fetchProfile, etc.)
}
