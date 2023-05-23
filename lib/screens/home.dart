import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/widgets/header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // call
  final Controller controller = Get.put(Controller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => controller.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: const [
                SizedBox(height: 20),
                Header(),
              ],
            )),
    ));
  }
}
