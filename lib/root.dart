import 'package:datn/controller/auth_controller.dart';
import 'package:datn/screen/home/home.dart';
import 'package:datn/screen/login/login_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController>{
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (_) {
        if (controller.isLoggedIn.value) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

}