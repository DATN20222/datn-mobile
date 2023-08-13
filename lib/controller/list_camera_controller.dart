import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCameraController extends GetxController with StateMixin {
  RxList<CameraModel> doorCameras = <CameraModel>[].obs;
  RxList<CameraModel> roomCameras = <CameraModel>[].obs;
  RxList<CameraModel> currentCameras = <CameraModel>[].obs;
  RxString typeCamera = "ROOM".obs;
  RxString typeSelect = "ROOM".obs;
  List<String> typeList = ["ROOM", "DOOR"];

  @override
  Future<void> onInit() async {
    // List<CameraModel> cameras = [];
    // currentCameras.value = [];
    change(null, status: RxStatus.loading());
    updateCurrentCameras();
    // cameras = await CameraApi.instance.getAllCamera() ?? [];
    // if (typeCamera.value == "ALL") {
    //   currentCameras.value = cameras;
    // } else {
    //   for (var item in cameras) {
    //     if (item.type == typeCamera.value) {
    //       currentCameras.value.add(item);
    //     }
    //   }
    // }
    // change(null, status: RxStatus.success());
    super.onInit();
  }

  changeTypeRoom(String type) async {
    // List<CameraModel> cameras = [];
    typeCamera.value = type;
    await updateCurrentCameras();
    // currentCameras.value = [];
    // cameras = await CameraApi.instance.getAllCamera() ?? [];
    // if (typeCamera.value == "ALL") {
    //   currentCameras.value = cameras;
    // } else {
    //   for (var item in cameras) {
    //     if (item.type == typeCamera.value) {
    //       currentCameras.value.add(item);
    //     }
    //   }
    // }
    // change(null, status: RxStatus.success());
  }


  addCamera(CameraModel cameraModel) async {
    final res = await CameraApi.instance.createCamera(cameraModel);
    if (res == 201) {
      Get.snackbar("Success", "Thêm mới thành công!", backgroundColor: Colors.white);
      await updateCurrentCameras();
      return true;
    } else {
      Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white, colorText: Colors.purple);
    }
  }

  setSelectedType(String newValue){
    typeSelect.value = newValue;
  }

  updateCurrentCameras() async {
    List<CameraModel> cameras = [];
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

  deleteCamera(String id) async {
    try {
      final res = await CameraApi.instance.deleteCamera(id);
      if (res != null) {
        Get.snackbar("Success", "Xóa thành công!", backgroundColor: Colors.white);
        await updateCurrentCameras();
        return true;
      } else {
        Get.snackbar("Error", "Có lỗi xảy ra! ", backgroundColor: Colors.white, colorText: Colors.purple);
      }
    }  catch (e) {
      print(e);
    }
  }

  updateCamera(String id, String name, String room) async {
    try {
      final res = await CameraApi.instance.updateCamera(id, name, room);
      if (res != null) {
        Get.snackbar("Success", "Cập nhật thành công!", backgroundColor: Colors.white);
        await updateCurrentCameras();
        return true;
      } else {
        Get.snackbar("Error", "Có lỗi xảy ra! ", backgroundColor: Colors.white, colorText: Colors.purple);
      }
    }  catch (e) {
      print(e);
    }
  }
}