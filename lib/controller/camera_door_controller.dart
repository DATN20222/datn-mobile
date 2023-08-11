import 'dart:async';

import 'package:get/get.dart';

class CameraDoorDetailController extends GetxController with StateMixin {
  Timer? timer;
  String? ip;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    ip = Get.parameters["ip"] as String;
    // await getInitData(ip!);
    // await updateUserInRoom();
    change(null, status: RxStatus.success());
    super.onInit();
  }
}