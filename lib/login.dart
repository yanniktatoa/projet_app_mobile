import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/loginpage.dart';

class HttpService {
  static final _client = http.Client();

  static final _loginUrl = Uri.parse('http://192.168.1.65/api/users');

  static login(name, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "name": name,
      "password": password,
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json[0] == 'success') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
