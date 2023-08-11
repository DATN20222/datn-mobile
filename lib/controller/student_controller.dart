import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController with StateMixin{
    RxList<User> users = <User>[].obs;
    RxList<User> needPermisUser = <User>[].obs;
    RxString selectedDrowpdown = 'USER'.obs;
    List<String> dropdownText = ['USER', 'ADMIN'];

    @override
    Future<void> onInit() async{
      change(null, status:RxStatus.loading());
      users.value = [];
      users.value = await UserApi.instance.getListUser();
      updateListUser();
      change(null, status: RxStatus.success());
      super.onInit();
  }

    @override
  Future<void> onReady() async {
      users.value = [];
      users.value = await UserApi.instance.getListUser();
      updateListUser();
    super.onReady();

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


    Future<bool> signUpWithRole(String phone, String name, String password, String email, int code, String role ) async{
    var res = await UserApi.instance.signUpWithRoleByAdmin(User(
      phone: phone, name: name, history: [], email: email, code: code, role: role,password: password
    ));
    if (res == 201) {
      Get.snackbar("Success", "Đăng ký thành công!", backgroundColor: Colors.white);
      users.value = await UserApi.instance.getListUser();
      updateListUser();
      change(null, status: RxStatus.success());
      return true;
    } else {
      Get.snackbar("Error", "Có lỗi xảy ra! ${res.toString()}", backgroundColor: Colors.white, colorText: Colors.purple);
    }
    return false;
  }

    Future<void> deleteUser(String id) async {
      var res = await UserApi.instance.deleteUser(id);
      if (res == 200){
        Get.snackbar("Success", "Xoá thành công!", backgroundColor: Colors.white, colorText: Colors.purple);
        users.value = await UserApi.instance.getListUser();
        updateListUser();
        change(null, status: RxStatus.success());
      } else {
        Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white, colorText: Colors.purple);
      }

  }
  void updateListUser(){
      needPermisUser.value = [];
      for (var item in users.value){
        if (item.role == null || item.role == "NO_ROLE"){
          needPermisUser.value.add(item);
        }
      }
  }

  setSelectedValue(String newValue){
      selectedDrowpdown.value = newValue;
  }
}