import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constant.dart';
import 'UserService.dart';

class APIService {
  static var client = http.Client();

  static Future<http.Response> requestPOST_No_Token(
      String keyAPI, Map<String, dynamic> data) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final url = Uri.parse('${MyConfig.apiURL}${keyAPI}');

    return client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(data),
    );
  }

  static Future<http.Response> requestPOST(
      String keyAPI, Map<String, dynamic> data) async {
    print("request: ${data.toString()}}");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${locator<UserService>().currentUser.jwt}'
    };

    var url = Uri.http(
      MyConfig.apiURL,
      keyAPI,
    );

    return client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(data),
    );
  }

  static Future<http.Response> requestGET(String keyAPI) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${locator<UserService>().currentUser.jwt}'
    };
    var url = Uri.http(
      MyConfig.apiURL,
      keyAPI,
    );

    return http.get(url, headers: headers);
  }
// ).timeout(
//             const Duration(
//               seconds: 10,
//             ), onTimeout: () {
//       return http.Response('Time out', 408);
//     });
}
