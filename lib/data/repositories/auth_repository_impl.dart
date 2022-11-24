import 'dart:convert';

import 'package:charter_flutter/data/data_sources/http/http_source.dart';
import 'package:charter_flutter/data/exceptions/http_exception.dart';
import 'package:charter_flutter/domain/repositories/auth_repository.dart';

class HttpAuthRepository implements AuthRepository {
  final HttpSource httpSource;

  HttpAuthRepository(this.httpSource);

  @override
  Map<String, String> get authHeader => {};

  @override
  String get path =>
      "/verifyPassword?key=AIzaSyBFiEDfEaaK6lBtIdxLXspmxGux1TGsCmg";

  @override
  Future<String> login() async {
    final Map<String, dynamic> response = await httpSource.post(
      path,
      data: jsonEncode({
        "email": "xihoh55496@dineroa.com",
        "password": "Marlo@123",
        "returnSecureToken": true
      }),
    );
    try {
      return response["idToken"];
    } catch (e) {
      throw HttpException(
          title: "Http Exception",
          message: "Error while signing up. Please try again");
    }
  }
}
