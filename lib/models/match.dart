import 'dart:convert';

class MatchModel {
  final Area area;
  final Competition competition;
  final Season season;
  final int id;
  final String utcDate;
  final String status;
  final int matchday;
  final String stage;
  final dynamic group;
  final String lastUpdated;
  final Team homeTeam;
  final Team awayTeam;
  final Score score;
  final Odds odds;
  final List<dynamic> referees;

  MatchModel({
    required this.area,
    required this.competition,
    required this.season,
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.odds,
    required this.referees,
  });

  MatchModel copyWith({
    Area? area,
    Competition? competition,
    Season? season,
    int? id,
    String? utcDate,
    String? status,
    int? matchday,
    String? stage,
    dynamic group,
    String? lastUpdated,
    Team? homeTeam,
    Team? awayTeam,
    Score? score,
    Odds? odds,
    List<dynamic>? referees,
  }) {
    return MatchModel(
      area: area ?? this.area,
      competition: competition ?? this.competition,
      season: season ?? this.season,
      id: id ?? this.id,
      utcDate: utcDate ?? this.utcDate,
      status: status ?? this.status,
      matchday: matchday ?? this.matchday,
      stage: stage ?? this.stage,
      group: group ?? this.group,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      score: score ?? this.score,
      odds: odds ?? this.odds,
      referees: referees ?? this.referees,
    );
  }

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      area: Area.fromMap(map['area']),
      competition: Competition.fromMap(map['competition']),
      season: Season.fromMap(map['season']),
      id: map['id'],
      utcDate: map['utcDate'],
      status: map['status'],
      matchday: map['matchday'],
      stage: map['stage'],
      group: map['group'],
      lastUpdated: map['lastUpdated'],
      homeTeam: Team.fromMap(map['homeTeam']),
      awayTeam: Team.fromMap(map['awayTeam']),
      score: Score.fromMap(map['score']),
      odds: Odds.fromMap(map['odds']),
      referees: List<dynamic>.from(map['referees']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'area': area.toMap(),
      'competition': competition.toMap(),
      'season': season.toMap(),
      'id': id,
      'utcDate': utcDate,
      'status': status,
      'matchday': matchday,
      'stage': stage,
      'group': group,
      'lastUpdated': lastUpdated,
      'homeTeam': homeTeam.toMap(),
      'awayTeam': awayTeam.toMap(),
      'score': score.toMap(),
      'odds': odds.toMap(),
      'referees': referees,
    };
  }

  String toJson() => json.encode(toMap());

  factory MatchModel.fromJson(String source) =>
      MatchModel.fromMap(json.decode(source));
}

class Area {
  final int id;
  final String name;
  final String code;
  final String flag;

  Area({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      flag: map['flag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'flag': flag,
    };
  }
}

class Competition {
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;

  Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });

  factory Competition.fromMap(Map<String, dynamic> map) {
    return Competition(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      type: map['type'],
      emblem: map['emblem'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type,
      'emblem': emblem,
    };
  }
}

class Season {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final dynamic winner;

  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map['id'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      currentMatchday: map['currentMatchday'],
      winner: map['winner'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'currentMatchday': currentMatchday,
      'winner': winner,
    };
  }
}

class Team {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      shortName: map['shortName'] ?? '',
      tla: map['tla'] ?? '',
      crest: map['crest'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
    };
  }
}

class Score {
  final dynamic winner;
  final String duration;
  final FullTime fullTime;
  final HalfTime halfTime;

  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
  });

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      winner: map['winner'],
      duration: map['duration'],
      fullTime: FullTime.fromMap(map['fullTime']),
      halfTime: HalfTime.fromMap(map['halfTime']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'winner': winner,
      'duration': duration,
      'fullTime': fullTime.toMap(),
      'halfTime': halfTime.toMap(),
    };
  }
}

class FullTime {
  final dynamic home;
  final dynamic away;

  FullTime({
    required this.home,
    required this.away,
  });

  factory FullTime.fromMap(Map<String, dynamic> map) {
    return FullTime(
      home: map['home'],
      away: map['away'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home': home,
      'away': away,
    };
  }
}

class HalfTime {
  final dynamic home;
  final dynamic away;

  HalfTime({
    required this.home,
    required this.away,
  });

  factory HalfTime.fromMap(Map<String, dynamic> map) {
    return HalfTime(
      home: map['home'],
      away: map['away'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home': home,
      'away': away,
    };
  }
}

class Odds {
  final String msg;

  Odds({
    required this.msg,
  });

  factory Odds.fromMap(Map<String, dynamic> map) {
    return Odds(
      msg: map['msg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
    };
  }
}
