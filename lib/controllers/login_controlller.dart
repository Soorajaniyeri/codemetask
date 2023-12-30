import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import '../views/detailsscreen.dart';
import 'package:http/http.dart' as http;

class LoginController extends ChangeNotifier {
  bool loading = false;

  Future<void> loginUser(
      String username, String password, BuildContext context) async {
    loading = true;
    notifyListeners();
    final url =
        Uri.parse('https://crm-beta-api.vozlead.in/api/v2/account/login/');
    final response = await http.post(
      url,
      body: jsonEncode(
        {'username': username, 'password': password},
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var body = UserData.fromJson(jsonDecode(response.body));
      storeToken(tkn: body.data.token);
      loading = false;
      notifyListeners();

      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DetailsScreen()));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Details")));
      loading = false;
      notifyListeners();
    }
  }

  storeToken({required String tkn}) async {
    SharedPreferences storeTkn = await SharedPreferences.getInstance();
    await storeTkn.setString("tok", tkn);
  }

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController pasCtrl = TextEditingController();
}
