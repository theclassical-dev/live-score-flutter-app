import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:livescore/core/api_engine.dart';
import 'package:livescore/models/leagues.dart';
import 'package:livescore/models/match.dart';

class ApiService {
  ApiEngine apiEngine = ApiEngine();

  Future<List<League>> getLeagues() async {
    try {
      http.Response response = await apiEngine.getData('/competitions');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['competitions'];
        List<League> leagues =
            jsonResponse.map((data) => League.fromMap(data)).toList();
        return leagues;
      } else {
        throw Exception(
            'Failed to load leagues. Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MatchModel>> getMatches() async {
    try {
      http.Response response = await apiEngine.getData('/matches');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['matches'];
        List<MatchModel> matches =
            jsonResponse.map((data) => MatchModel.fromMap(data)).toList();
        return matches;
      } else {
        throw Exception(
            'Failed to load match. Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
