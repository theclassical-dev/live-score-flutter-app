import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/models/articles.dart';
import 'package:livescore/models/leagues.dart';
import 'package:livescore/models/match.dart';

final leagueListProvider = FutureProvider<List<League>>((ref) async {
  return ref.watch(apiServiceProvider).getLeagues();
});

final matchListProvider = FutureProvider<List<MatchModel>>((ref) async {
  return ref.watch(apiServiceProvider).getMatches();
});
final recentPlayedMatchListProvider =
    FutureProvider<List<MatchModel>>((ref) async {
  return ref.watch(apiServiceProvider).getRecentPlayedMatches();
});

final articleListProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(apiServiceProvider).getArticleList();
});
