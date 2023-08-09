import 'dart:async';
import 'dart:io';

import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/users.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';


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
    user.value = (await UserApi.instance.getInforUserById(id.value))!;
    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }

  Future<void> generateExcel() async {
// Create a new Excel document.
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    //Creating a new style with all properties.
    final Style timesNewRomanStyle =
    workbook.styles.add('timesNewRomanStyle');
    timesNewRomanStyle.fontName = 'TimesNewRoman';

    //header text style
    final Style headerTextStyle = workbook.styles.add('headerTextStyle');
    headerTextStyle.bold = true;
    headerTextStyle.fontName = 'TimesNewRoman';
    headerTextStyle.fontSize = 14;

    sheet.getRangeByName('A1').setText('Thời gian');
    sheet.getRangeByName('B1').setText('Camera');


    for (var i = 0; i < user.value.history.length; i++) {
      final item = user.value.history[i];
      sheet.getRangeByIndex(i + 2, 1).setDateTime(item.timeStamp);
      sheet.getRangeByIndex(i + 2, 2).setText(item.cameraId);
    }


    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await saveAndLaunchFile(bytes, 'Test${user.value.phone}.xlsx');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    //Get the storage folder location using path_provider package.
    String? path;
    if (Platform.isAndroid ||
        Platform.isIOS) {
      final Directory directory =
      await path_provider.getApplicationSupportDirectory();
      path = directory.path;
    } else {
      path = await PathProviderPlatform.instance.getApplicationSupportPath();
    }
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final File file =
    File(Platform.isWindows ? '$path\\$fileName' : '/storage/emulated/0/Download/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (Platform.isAndroid || Platform.isIOS) {
      //Launch the file (used open_file package)
      // emit(state.copyWith(filePath: '/storage/emulated/0/Download/$fileName'));
      // await open_file.OpenFile.open('/storage/emulated/0/Download/${fileName}');
      Get.snackbar("Saving","Lưu file thành công");
    }
  }
}