import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_o1/api_key/key.dart';
import 'package:task_o1/models/userinfo.dart';

class ApiManager {
  Future<Suppliers> getUser() async {
    final client = http.Client();
    var userModel;
    http.Response response;

    try {
      response = await http.get(ApiUrl.url);
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        userModel = Suppliers.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
    }
    return userModel;
  }

  Future<int> submit(String name, String quantity) async {
    final url = SavingUrl.subUrl;

    final response = await http
        .post(url, body: {"supplier_name": name, "quantity": quantity});
    print(response.body);
    return response.statusCode;
  }
}
