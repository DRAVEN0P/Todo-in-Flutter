import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar = AppBar(
  elevation: 0,
  title: const Text(
    "Todo",
  ),
  actions: [MyToggleButton()],
);

// Toggle Button
class MyToggleButton extends StatefulWidget {
  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      icon: Icon(
        isToggled ? Icons.toggle_on : Icons.toggle_off,
        color: isToggled ? Color.fromARGB(255, 1, 2, 1) : Colors.grey,
      ),
      onPressed: () {
        Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
        setState(() {
          isToggled = !isToggled;
        });
      },
    );
  }
}
