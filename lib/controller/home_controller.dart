import 'package:datn/models/camera.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final getStorge = GetStorage();
  RxString name = "".obs;
  RxString phone = "".obs;
  RxInt code = 0.obs;
  var isLoggedIn = false.obs;
  bool isLoading = true;
  RxList<CamerasModel>? listCamera = <CamerasModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    name.value = getStorge.read("name");
    phone.value = getStorge.read("phone");
    code.value = getStorge.read("code");

  }

  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    super.onClose();
  }

  logout() {
    getStorge.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

}