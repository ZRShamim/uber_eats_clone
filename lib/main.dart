import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uber_eats_clone/view/pages/home_screen/home_page.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(420, 810),
    minTextAdapt: true,
    builder: () {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    }
  ),);
}