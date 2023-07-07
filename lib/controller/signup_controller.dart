import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
    RxBool isLoading = false.obs;

    signUp(String phone, String password, String email, int code, String name) async{
        User user = User(name: name,
            password: password,
            email: email,
            code: code,
            phone: phone,
            history: []
        );
        isLoading.value = true;
        final res = await UserApi.instance.signUp(user);
        isLoading.value = false;
        if (res == 201) {
            Get.snackbar("Success", "Đăng ký thành công, đợi cán bộ cấp quyền để có thể truy cập!", backgroundColor: Colors.white);
            Future.delayed(const Duration(milliseconds: 2000), (){
                Get.offAllNamed(Routes.LOGIN);
            });
        } else {
            Get.snackbar("Error", "Có lỗi xảy ra!", backgroundColor: Colors.white);
        }
    }
}