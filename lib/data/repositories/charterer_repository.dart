import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/charterer_repository.dart';
import '../../injection_container.dart';
import '../data_sources/http/http_source.dart';

class HttpChartererRepository implements ChartererRepository {
  final HttpSource httpSource;

  HttpChartererRepository(this.httpSource);

  @override
  Map<String, String> get authHeader =>
      {"authtoken": sl.get<SharedPreferences>().get("token") as String? ?? ""};

  @override
  String get path =>
      "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/contracts/charterers";

  @override
  Future<dynamic> addCharterer(dynamic data) async {
    final Map<String, dynamic> response =
        await httpSource.post(path, headers: authHeader, data: data);
    return response;
  }

  @override
  Future<List<String>> searchCharterers(String query) async {
    final Map<String, dynamic> response = await httpSource.get("$path/search",
        queryParameters: {"charterer_name": query}, headers: authHeader);

    return (response["data"] as List)
        .map((e) => e['chartererName'].toString())
        .toList();
  }
}
