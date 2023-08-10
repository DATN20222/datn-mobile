import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:get/get.dart';

class ListCameraController extends GetxController with StateMixin {
  RxList<CameraModel> doorCameras = <CameraModel>[].obs;
  RxList<CameraModel> roomCameras = <CameraModel>[].obs;
  RxList<CameraModel> currentCameras = <CameraModel>[].obs;
  RxString typeCamera = "ROOM".obs;

  @override
  Future<void> onInit() async {
    List<CameraModel> cameras = [];
    currentCameras.value = [];
    change(null, status: RxStatus.loading());
    cameras = await CameraApi.instance.getAllCamera() ?? [];
    if (typeCamera.value == "ALL") {
      currentCameras.value = cameras;
    } else {
      for (var item in cameras) {
        if (item.type == typeCamera.value) {
          currentCameras.value.add(item);
        }
      }
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  changeTypeRoom(String type) async {
    List<CameraModel> cameras = [];
    typeCamera.value = type;
    currentCameras.value = [];
    cameras = await CameraApi.instance.getAllCamera() ?? [];
    if (typeCamera.value == "ALL") {
      currentCameras.value = cameras;
    } else {
      for (var item in cameras) {
        if (item.type == typeCamera.value) {
          currentCameras.value.add(item);
        }
      }
    }
    change(null, status: RxStatus.success());
  }


  addCamera() async {

  }
}