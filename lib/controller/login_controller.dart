import 'package:datn/datas/api/authApi.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  RxInt code = 600.obs;

  final getStorge = GetStorage();
  RxBool visiblePassword = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login(String password, String phone) async {
    print("Login");
    isLoading.value = true;
    print(isLoading.value);
    final res =  await AuthApi.instance.login(phone, password);
    print("Finish call api login");
    isLoading.value = false;
    if (res == 201){
      code.value = 200;

      Get.offAllNamed(Routes.SPLASH);
    } else {
      Get.snackbar("Error", "Password incorrect!", backgroundColor: Colors.white, colorText: Colors.purple);
    }
  }


  void changeVisible(){
    visiblePassword.value = !visiblePassword.value;
  }

}