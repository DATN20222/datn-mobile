import 'dart:async';

import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with StateMixin{
  final getStorge = GetStorage();
  RxString name = "".obs;
  RxString phone = "".obs;
  RxInt code = 0.obs;
  RxInt countNumber = 0.obs;
  RxDouble averageTemp = 0.0.obs;
  RxDouble averageHud = 0.0.obs;
  RxDouble averagePpm = 0.0.obs;
  RxInt countCamera = 0.obs;
  var isLoggedIn = false.obs;
  bool isLoading = true;
  RxList<CameraModel>? listCamera = <CameraModel>[].obs;
  late Timer timer;

  @override
  Future<void> onInit() async {
    name.value = getStorge.read("name");
    phone.value = getStorge.read("phone");
    code.value = getStorge.read("code");
    change(null, status: RxStatus.loading());
    // listCamera?.value = await CameraApi.instance.getAllCamera();
    await getValues();
    // change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    timer = Timer.periodic(const Duration(seconds: 2),(_) => getValues());
    print("Ready");
    super.onReady();
  }


  @override
  void onClose() {
    print("Close");
    timer.cancel();
    super.onClose();
  }

  @override
  void onResume(){
    print("On resume");
  }

  @override
  void onInactive(){
    print("on Inactive");
  }
  @override
  void onPaused(){
    print("on Paused");
  }
  @override
  void onDetached(){
    print("onDetached");
  }

  logout() {
    getStorge.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  getValues() async {
    var averTemp = 0.0;
    var averHum = 0.0;
    var averPpm = 0.0;

    countCamera.value = 0;
    listCamera?.value = await CameraApi.instance.getAllCamera() ?? [];
    for (var item in listCamera!){
      if (item.type == "DOOR") continue;

      averTemp = averTemp + (item.temperature ?? 0.0);
      averHum = averHum + (item.humidity ?? 0.0);
      averPpm = averPpm + (item.ppm ?? 0.0);
      countCamera.value = countCamera.value + 1;
    }
    averageTemp.value = averTemp /countCamera.value;
    averageHud.value = averHum / countCamera.value;
    averagePpm.value = averPpm / countCamera.value;
    change(null, status: RxStatus.success());
    listCamera!.refresh();
  }

}