abstract class ChartererRepository {
  String get path;

  Map<String, String> get authHeader;

  Future<List<String>> searchCharterers(String query);
  Future<dynamic> addCharterer(dynamic data);
}
