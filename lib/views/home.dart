import 'package:basic_calculator_app/controllers/calculator_controller.dart';
import 'package:basic_calculator_app/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/theme_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeController themeController = Get.put(ThemeController());
    CalculatorController calculatorController = Get.put(CalculatorController());
    var size = Get.size;

    return Obx(() => Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.015,),
            Container(
              width: size.width * 0.25,
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value ? Colors.white12 : Colors.black12,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        themeController.isDarkMode.value = false;
                        Get.changeTheme(ThemeData.light());
                        Get.changeThemeMode(ThemeMode.light);
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString("theme", "light");
                        // Get.reloadAll(force: true);
                        print("Changed to Light Theme");
                      },
                      child: Icon(Icons.light_mode, 
                        color: themeController.isDarkMode.value 
                          ? Colors.white38 : Colors.black,
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        themeController.isDarkMode.value = true;
                        Get.changeTheme(ThemeData.dark());
                        Get.changeThemeMode(ThemeMode.dark);
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString("theme", "dark");
                        // Get.reloadAll(force: true);
                        print("Changed to Dark Theme");
                      },
                      child: Icon(Icons.dark_mode, 
                        color: themeController.isDarkMode.value 
                          ? Colors.white : Colors.black38,
                      )
                    ),
                  ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                alignment: Alignment.bottomRight,
                child: Obx(() => Text(calculatorController.display.value,
                  style: TextStyle(
                    fontSize: size.width * 0.081,
                    color: themeController.isDarkMode.value ? Colors.white54 : Colors.black54,
                  ),
                  textAlign: TextAlign.right,
                ),)              
              )
            ),
            Container(
              height: 1,
              color: themeController.isDarkMode.value ? Colors.white12 : Colors.black12,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    CalculatorButton(
                      label: '7',
                      onPressed: () =>
                          calculatorController.onButtonPressed('7'), 
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '8',
                      onPressed: () =>
                          calculatorController.onButtonPressed('8'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '9',
                      onPressed: () =>
                          calculatorController.onButtonPressed('9'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '÷',
                      onPressed: () =>
                          calculatorController.onButtonPressed('÷'),
                      labelColor: const Color(0xFFFC530B),
                    ),
                    CalculatorButton(
                      label: '4',
                      onPressed: () =>
                          calculatorController.onButtonPressed('4'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '5',
                      onPressed: () =>
                          calculatorController.onButtonPressed('5'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '6',
                      onPressed: () =>
                          calculatorController.onButtonPressed('6'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '×',
                      onPressed: () =>
                          calculatorController.onButtonPressed('×'),
                      labelColor: const Color(0xFFFC530B),
                    ),
                    CalculatorButton(
                      label: '1',
                      onPressed: () =>
                          calculatorController.onButtonPressed('1'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '2',
                      onPressed: () =>
                          calculatorController.onButtonPressed('2'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '3',
                      onPressed: () =>
                          calculatorController.onButtonPressed('3'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '–',
                      onPressed: () =>
                          calculatorController.onButtonPressed('–'),
                      labelColor: const Color(0xFFFC530B),
                    ),
                    CalculatorButton(
                      label: 'C',
                      onPressed: () =>
                          calculatorController.onButtonPressed('C'),
                      labelColor: const Color(0xFFFC530B),
                    ),
                    CalculatorButton(
                      label: '0',
                      onPressed: () =>
                          calculatorController.onButtonPressed('0'),
                          labelColor: themeController.isDarkMode.value 
                            ? Colors.white : Colors.black,
                    ),
                    CalculatorButton(
                      label: '+',
                      onPressed: () =>
                          calculatorController.onButtonPressed('+'),
                      labelColor: const Color(0xFFFC530B),
                    ),
                    CalculatorButton(
                      label: '=',
                      onPressed: () =>
                          calculatorController.onButtonPressed('='),
                      labelColor: Colors.white,
                      bgColor: const Color(0xFFFC530B),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    ));   
  }
}