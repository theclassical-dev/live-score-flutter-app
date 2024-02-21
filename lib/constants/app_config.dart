class AppUrlConstants {
  static const String baseURL = "http://api.football-data.org/v4";
  static const String token = "0eb806f001ae4d7eb7c6e1675c0299d1";
  static const String newsBaseURL =
      "https://newsapi.org/v2/everything?domains=skysports.com";
  static const newsApiKey = "4ff2de299df744079b1466b94a27149b";
  //filter filter must not pass 10days
  // https://api.football-data.org/v4/matches/?dateFrom=2024-01-31&dateTo=2024-02-10
  //finished filter matches with data
  // https://api.football-data.org/v4/matches/?date=2024-02-01&status=FINISHED
  //further filter on match ahead or played just change status
  // https://api.football-data.org/v4/matches/?dateFrom=2024-01-31&dateTo=2024-02-10&status=SCHEDULED
}
