import 'package:http/http.dart' as http;
import 'package:livescore/constants/app_config.dart';

class ApiEngine {
  final String baseUrl = AppUrlConstants.baseURL;
  final String token = AppUrlConstants.token;
  final String newsUrl = AppUrlConstants.newsBaseURL;
  final String newsKey = AppUrlConstants.newsApiKey;

  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'X-Auth-Token': token,
    });
    return response;
  }

  Future<http.Response> getNewsData() async {
    final url = Uri.parse(newsUrl);
    final response = await http.get(url, headers: {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'X-Api-Key': newsKey,
    });
    return response;
  }
}
