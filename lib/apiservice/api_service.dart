import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  static const BASE_URL = "https://mobileapp.annabelleme.com/en/rest/V1/";

  static const homePage = "${BASE_URL}homepage";
  static const SUCCESS = 200;

  static Map<String, String> fixHeader = {
    'Content-Type': 'application/json'
  };

  static Future<dynamic> callPostApi(
      String url,
      Object params,
      BuildContext context,
      Function? onError) async {
    print("ApiService Post Api: $url");
    print("ApiService Api Params: $params");
    print("ApiService Api Header: $fixHeader");

    var response = await http.post(
      Uri.parse(url),
      body: params,
      headers: fixHeader
    );

    print("ApiService Post Response : ${json.decode(response.body)}");
    print("ApiService Post Response Code : ${response.statusCode}");
    if (response.statusCode == SUCCESS) {
      return jsonDecode(response.body);
    } else {
      if (onError != null) {
        onError();
      }
      return null;
    }
  }
}
