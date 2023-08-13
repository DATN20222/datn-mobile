
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeUserController extends GetxController with StateMixin{
  final getStorge = GetStorage();
  late Rx<User> user = User(name: '', phone: '', history: []).obs;
  late Timer timer;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    await getInforUser();
    super.onInit();
  }

  getInforUser() async{
    try{
      print("Update");
      user.value = await UserApi.instance.getUserByToken();
      change(null, status: RxStatus.success());
    } catch (e){
      print(e);
    }
  }

  parsePosition(String base64String) {
    Uint8List uint8List = base64.decode(base64String.trim());

    // Assuming each float64 value occupies 8 bytes
    int numberOfDoubles = uint8List.length ~/ 8;
    var float64List = Float64List(numberOfDoubles);

    for (int i = 0; i < numberOfDoubles; i++) {
      int offset = i * 8;
      float64List[i] =
          uint8List.buffer.asByteData().getFloat64(offset, Endian.little);
    }

    return float64List;
  }

  @override
  void onReady() {
    timer = Timer.periodic(const Duration(seconds: 2),(_) => getInforUser());
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}