import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  
  RxBool isDarkMode = false.obs;

  @override
  void onInit() async{
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("theme")) {
      if (sharedPreferences.getString("theme")! == "light") {
        isDarkMode.value = false;
        Get.changeTheme(ThemeData.light());
        Get.changeThemeMode(ThemeMode.light);
      } else {
        isDarkMode.value = true;
        Get.changeTheme(ThemeData.dark());
        Get.changeThemeMode(ThemeMode.dark);
      }
    } else {
      Get.changeTheme(ThemeData.light());
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}