import 'package:flutter/foundation.dart';
import 'package:sparkhire_api/sparkhire_api.dart';

class ApiProvider with ChangeNotifier {
  final SparkhireApi api = SparkhireApi(
    basePathOverride: "http://localhost:8000/api",
  );

  void setToken(String token) {
    api.setBearerAuth("bearerAuth", token);
  }
}
