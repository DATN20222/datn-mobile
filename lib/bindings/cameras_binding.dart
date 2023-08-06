import 'package:datn/controller/list_camera_controller.dart';
import 'package:get/get.dart';

class CamerasBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ListCameraController>(() => ListCameraController());
  }

}