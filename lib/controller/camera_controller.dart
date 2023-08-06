import 'dart:async';

import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/models/events.dart';
import 'package:datn/models/historyUser.dart';
import 'package:datn/models/users.dart';
import 'package:get/get.dart';

class CameraController extends GetxController with StateMixin {
  RxString image = "".obs;

  RxDouble ppm = 0.0.obs;
  RxDouble temperature = 0.0.obs;
  RxDouble humidity = 0.0.obs;
  Rx<CameraModel> camera = CameraModel(name: "", ip: "", room: "").obs;
  RxList<User> usersInRoom = <User>[].obs;
  RxList<EventModel> events = <EventModel>[].obs;

  Timer? timer;
  String? ip;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    ip = Get.parameters["ip"] as String;
    await getInitData(ip!);
    await updateUserInRoom();
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
    await updateUserInRoom();
    change(null, status: RxStatus.success());
  }

  updateUserInRoom() async {
    List<User> users = await UserApi.instance.getListUser();
    usersInRoom.value = [];
    for (var index = 0; index < users.length; index ++){
      if (users[index].history.isNotEmpty){
        if (users[index].history[users[index].history.length - 1].cameraId != ip){
          continue;
        }
        if (users[index].history[users[index].history.length - 1].timeStamp.compareTo(DateTime.now().subtract(Duration(seconds: 2))) == 1){
          usersInRoom.value.add(users[index]);
        }
      }
    }
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
