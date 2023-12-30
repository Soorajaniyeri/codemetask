import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usermodel.dart';
import 'package:http/http.dart' as http;

class DetailsController extends ChangeNotifier {
  String? tkn;

  getTocKen() async {
    SharedPreferences getTkn = await SharedPreferences.getInstance();
    tkn = getTkn.getString("tok");
  }

  Future<UserModel> fetchLeadList() async {
    try {
      final url =
          Uri.parse('https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/');
      await getTocKen();

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $tkn',
        },
      );

      if (response.statusCode == 200) {
        var body = UserModel.fromJson(jsonDecode(response.body));
        return body;
      } else {
        print(response.statusCode);

        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load data. Error: $error');
    }
  }
}
