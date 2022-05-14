import 'dart:convert';

import 'package:drc_practical/apiservice/api_service.dart';
import 'package:drc_practical/apiservice/model/home_page_response_model.dart';
import 'package:drc_practical/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isAPICall = true.obs;
  final homeResponse = HomePageResponseModel().obs;
  final pageController = PageController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callHomeDataAPI();
  }

  callHomeDataAPI() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          'customer_id': "",
        };
        isAPICall.value = true;
        ApiService.callPostApi(
            ApiService.homePage, jsonEncode(params), Get.context!, () {
          isAPICall.value = false;
        }).then((response) {
          isAPICall.value = false;
          homeResponse.value =
              homePageResponseModelFromJson(jsonEncode(response)).first;
        });
      }else{
        isAPICall.value = false;
      }
    });
  }
}
