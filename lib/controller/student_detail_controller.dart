import 'dart:async';

import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:get/get.dart';


class StudentDetailController extends GetxController with StateMixin{
  late Rx<User> user = User(name: '', phone: '', history: []).obs;
  late RxString id = "".obs;
  Timer? timer;

  @override
  Future<void> onInit() async{
    id.value = Get.parameters["id"] as String;
    change(null, status: RxStatus.loading());
    user.value = (await UserApi.instance.getInforUserById(id.value))!;
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    timer = Timer.periodic(const Duration(seconds: 7),(_) => updateDataSource());
    super.onReady();
  }

  updateDataSource() async {

  }


}