import 'package:drc_practical/constants/app_colors.dart';
import 'package:drc_practical/constants/strings.dart';
import 'package:drc_practical/pages/home/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: app_name,
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}
