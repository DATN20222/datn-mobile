import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  Future<void> onInit() async {
    print("init");
    if (getStorage.read("token") != null){
      print("Get infor");
        User? user = await UserApi.instance.getUserInfo();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("token") != null && getStorage.read("id") != null) {
      final role = getStorage.read("role");
      if (role == "ADMIN" || role == "SUPER_ADMIN") {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.offAllNamed(Routes.LOGIN);
      });

    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}