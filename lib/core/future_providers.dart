import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/models/leagues.dart';

final leagueListProvider = FutureProvider<List<League>>((ref) async {
  return ref.watch(apiServiceProvider).getLeagues();
});
