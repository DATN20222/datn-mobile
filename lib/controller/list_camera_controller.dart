import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:get/get.dart';

class ListCameraController extends GetxController with StateMixin {
  RxList<CameraModel> doorCameras = <CameraModel>[].obs;
  RxList<CameraModel> roomCameras = <CameraModel>[].obs;

  @override
  Future<void> onInit() async {
    List<CameraModel> cameras = [];
    change(null, status: RxStatus.loading());
    cameras = await CameraApi.instance.getAllCamera() ?? [];
    for (var item in cameras){
      if(item.type == "DOOR") {
        doorCameras.value.add(item);
      } else {
        roomCameras.value.add(item);
      }
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }
}