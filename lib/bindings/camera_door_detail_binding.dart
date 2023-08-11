import 'package:datn/controller/camera_door_controller.dart';
import 'package:get/get.dart';

class CameraDoorDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CameraDoorDetailController());
  }

}