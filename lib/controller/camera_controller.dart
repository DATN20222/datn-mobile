import 'dart:async';

import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/models/events.dart';
import 'package:get/get.dart';

class CameraController extends GetxController with StateMixin {
  RxString image = "".obs;

  RxDouble ppm = 0.0.obs;
  RxDouble temperature = 0.0.obs;
  RxDouble humidity = 0.0.obs;
  Rx<CameraModel> camera = CameraModel(name: "", ip: "").obs;

  RxList<EventModel> events = <EventModel>[].obs;

  Timer? timer;
  String? ip;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    ip = Get.parameters["ip"] as String;
    await getInitData(ip!);
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    timer = Timer.periodic(const Duration(seconds: 2),(_) => updateDataSource());
    super.onReady();
  }

  @override
  void onClose() {
    print("Close");
    timer!.cancel();
    super.onClose();
  }

  updateDataSource() async {
    EventModel eventModel = await CameraApi.instance.getEventCamera(ip!);
    DateTime compareTime = DateTime.now().subtract(const Duration(seconds: 10));
    if (eventModel.timeStamp!.isAfter(compareTime)){
      events.value.add(eventModel);
      print("Update");
    }
    camera.value = await CameraApi.instance.getInforCameraByIp(ip!, DateTime.now());
    image.value = camera.value.image;
    change(null, status: RxStatus.success());
  }

  getInitData(String ip) async {
    camera.value = await CameraApi.instance.getInforCameraByIp(ip, DateTime.now());
    image.value = camera.value.image;
    ppm.value = camera.value.ppm ?? 0.0;
    temperature.value = camera.value.temperature ?? 0.0;
    humidity.value = camera.value.humidity ?? 0.0;
    events.value = camera.value.event ?? [];
  }



}
