import 'package:datn/controller/camera_controller.dart';
import 'package:get/get.dart';

class CameraBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CameraController());
  }

}