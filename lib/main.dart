import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knee_rom/page/camera/camera_ctl.dart';
import 'package:knee_rom/page/camera/camera_page.dart';
import 'package:knee_rom/page/main/main_page.dart';

void main() {
  Get.put(CameraCtl());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KneeROM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/camera',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/camera', page: () => CameraPage()),
      ],
    );
  }
}
