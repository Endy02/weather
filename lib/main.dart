import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather/screens/home.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        home: Home(), title: "Weather", debugShowCheckedModeBanner: false);
  }
}
