import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:project_cobalt/core/base/base_service.dart';

class APIService extends BaseService {
  final httpInstance = http.Client();

  getAPIResponse() async {
    var response = await httpInstance.get(
      Uri.https('Base URL here', 'URL extension here',
          {'header-host': 'host link here', 'header-key': 'SIGN-UP-FOR-KEY'}),
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of items: $itemCount');
    } else {
      print('Request failed. Status: ${response.statusCode}');
    }
  }
}
