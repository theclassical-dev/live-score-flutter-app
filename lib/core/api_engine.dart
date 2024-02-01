import 'package:http/http.dart' as http;
import 'package:livescore/constants/app_config.dart';

class ApiEngine {
  final String baseUrl = AppUrlConstants.baseURL;
  final String token = AppUrlConstants.token;

  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'X-Auth-Token': token,
    });
    return response;
  }
}
