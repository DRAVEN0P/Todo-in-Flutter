import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/main/theme/themes.dart';
import 'package:todo_getx/main/views/view.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: "Todo Using Getx",
      home: HomePage(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
    );
  }
}
