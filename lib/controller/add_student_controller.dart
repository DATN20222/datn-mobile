import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController with StateMixin {
  late Rx<User> user = User(name: '', phone: '', history: []).obs;
  late RxString id = "".obs;

  @override
  Future<void> onInit() async{
    id.value = Get.parameters["id"] as String;
    change(null, status: RxStatus.loading());
    user.value = (await UserApi.instance.getInforUserById(id.value))!;
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> deleteUser() async {
    var res = await UserApi.instance.deleteUser(id.value);
    if (res == 200){
      Get.snackbar("Success", "Xoá thành công!", backgroundColor: Colors.white, colorText: Colors.purple);
      // users.value = await UserApi.instance.getListUser();
      // updateListUser();
      change(null, status: RxStatus.success());
    } else {
      Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white, colorText: Colors.purple);
    }

  }
}