import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

class CameraCtl extends GetxController {
  static CameraCtl get ctl => Get.find();

  /// available cameras
  final cameras = <CameraDescription>[].obs;

  /// pictures taken so far
  final pictures = <XFile>[].obs;

  /// controls whether the camera controller is initialized
  final isCameraControllerInitialized = false.obs;

  late final CameraController cameraController;

  @override
  Future<void> onInit() async {
    super.onInit();
    // fetching the available cameras.
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras.value = await availableCameras();
    } on CameraException catch (e) {
      debugPrint('${e.code} ${e.description}');
    }

    // by default, the main camera (rear camera) with maximum resolution
    // would be selected for the camera controller
    cameraController = CameraController(cameras[0], ResolutionPreset.max);

    // initializing the camera controller
    cameraController
        .initialize()
        .then((_) => cameraController.setFlashMode(FlashMode.off))
        .then((_) => isCameraControllerInitialized.value = true);
  }

  /// takes a picture and adds it to pictures list
  void takePicture() async {
    // return if the camera is taking a picture
    if (cameraController.value.isTakingPicture) return;

    try {
      final file = await cameraController.takePicture();
      pictures.add(file);
    } on CameraException catch (e) {
      Get.snackbar('camera error', e.description.toString());
    } finally {
      debugPrint('picture took: ${ctl.pictures.last.path}}');
    }
  }
}
