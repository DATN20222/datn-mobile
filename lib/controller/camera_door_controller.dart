import 'dart:async';

import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:get/get.dart';

class CameraDoorDetailController extends GetxController with StateMixin {
  Timer? timer;
  String? ip;
  Rx<CameraModel> cameraModel = CameraModel(name: "name", ip: "ip", room: "room").obs;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    ip = Get.parameters["ip"] as String ?? "";
    await updateCamera();
    change(null, status: RxStatus.success());
    super.onInit();
  }


  @override
  void onReady() {
    timer = Timer(Duration(seconds: 1), () {
      updateCamera();
    });
    super.onReady();
  }
  
  updateCamera() async{
    cameraModel.value = await CameraApi.instance.getCheckInDoorCamera(ip!) ?? CameraModel(name: "", ip: "", room: "");
  }

  @override
  void onClose() {
    if (timer != null){
      timer!.cancel();
    }
    super.onClose();
  }
}