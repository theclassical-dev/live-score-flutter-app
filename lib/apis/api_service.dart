import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:livescore/core/api_engine.dart';
import 'package:livescore/core/utlis.dart';
import 'package:livescore/models/articles.dart';
import 'package:livescore/models/leagues.dart';
import 'package:livescore/models/match.dart';

class ApiService {
  ApiEngine apiEngine = ApiEngine();

  //date
  String todaysDate = UtilsExtension.getTodaysDate();
  String nextDates = UtilsExtension.getFutureDate(7);
  String nextDay = UtilsExtension.getFutureDate(1);
  String subDateFrom = UtilsExtension.getSubtractedDate(6);
  String subDateTo = UtilsExtension.getSubtractedDate(1);

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
      // http.Response response = await apiEngine.getData('/matches');
      http.Response response = await apiEngine
          .getData('/matches/?dateFrom=$todaysDate&dateTo=$nextDates');
      // .getData('/matches/?dateFrom=2024-02-11&dateTo=2024-02-19');
      // .getData('/matches/?dateFrom=$todaysDate&dateTo=$nextTenDates');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['matches'];
        List<MatchModel> matches = jsonResponse
            .map((data) => MatchModel.fromMap(data ?? {}))
            // ignore: unnecessary_null_comparison
            .where((match) => match != null)
            .toList();
        return matches;
      } else {
        throw Exception(
            'Failed to load match. Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  //recent played games
  Future<List<MatchModel>> getRecentPlayedMatches() async {
    try {
      http.Response response = await apiEngine
          .getData('/matches/?dateFrom=$subDateFrom&dateTo=$nextDay');

      // print(response.body);
      // print(subDateFrom);
      // print(subDateTo);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['matches'];
        List<MatchModel> matches = jsonResponse
            .map((data) => MatchModel.fromMap(data ?? {}))
            // ignore: unnecessary_null_comparison
            .where((match) => match != null)
            .toList();
        return matches;
      } else {
        throw Exception(
            'Failed to load match. Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> getArticleList() async {
    try {
      http.Response response = await apiEngine.getNewsData();

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['articles'];

        List<Article> articles = jsonResponse
            .map((data) => Article.fromMap(data ?? {}))
            // ignore: unnecessary_null_comparison
            .where((artcile) => artcile != null)
            .toList();
        return articles;
      } else {
        throw Exception(
            'Failed to load artciles. Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
