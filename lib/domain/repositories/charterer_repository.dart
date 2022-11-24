abstract class AuthRepository {
  String get path;

  Map<String, String> get authHeader;

  Future<String> searchCharterers();
  Future<String> addCharterer();
}
