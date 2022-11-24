abstract class AuthRepository {
  String get path;

  Map<String, String> get authHeader;

  /// Returns token if login is successful
  Future<String> login();
}
