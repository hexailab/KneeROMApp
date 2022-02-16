import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knee_rom/page/camera/camera_ctl.dart';
import 'package:knee_rom/page/camera/camera_filter.dart';

class CameraPage extends StatelessWidget {
  CameraPage({Key? key}) : super(key: key);

  final ctl = CameraCtl.ctl;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() {
        return ctl.isCameraControllerInitialized.value
            ? CameraPreview(
                ctl.cameraController,
                child: CustomPaint(
                  painter: CameraLineFilter(),
                  child: CameraBottomPanel(),
                ),
              )
            : Container();
      }),
    );
  }
}

class CameraBottomPanel extends StatelessWidget {
  CameraBottomPanel({Key? key}) : super(key: key);

  final ctl = CameraCtl.ctl;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                onPressed: ctl.takePicture,
                icon: const Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                iconSize: 50,
              ),
            ),
          ),
          if (ctl.pictures.isNotEmpty)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 64.0,
                  height: 64.0,
                  child: InkWell(
                    child: Image.file(File(ctl.pictures.last.path)),
                    onTap: () => Get.toNamed('/'),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
