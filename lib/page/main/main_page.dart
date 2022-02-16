import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knee_rom/page/camera/camera_ctl.dart';
import 'package:knee_rom/page/camera/camera_filter.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final ctl = CameraCtl.ctl;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() => ctl.pictures.isNotEmpty
          ? CustomPaint(
              foregroundPainter: CameraLineFilter(),
              child: Image.file(File(ctl.pictures.last.path)),
            )
          : Container()),
    );
  }
}
