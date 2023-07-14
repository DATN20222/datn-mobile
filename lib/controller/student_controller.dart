import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController with StateMixin{
    RxList<User> users = <User>[].obs;

    @override
    Future<void> onInit() async{
      change(null, status:RxStatus.loading());
      users.value = await UserApi.instance.getListUser();
      change(null, status: RxStatus.success());
      super.onInit();
  }

  Future<bool> signUpWithRole(String phone, String name, String password, String email, int code, String role ) async{
    var res = await UserApi.instance.signUpWithRoleByAdmin(User(
      phone: phone, name: name, history: [], email: email, code: code, role: role,password: password
    ));
    if (res == 201) {
      Get.snackbar("Success", "Đăng ký thành công!", backgroundColor: Colors.white);
      users.value = await UserApi.instance.getListUser();
      change(null, status: RxStatus.success());
      return true;
    } else {
      Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white);
    }
    return false;
  }

}