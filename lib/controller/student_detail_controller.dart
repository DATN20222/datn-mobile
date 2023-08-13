import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';

import 'package:datn/datas/api/cameraApi.dart';
import 'package:datn/datas/api/userApi.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/models/historyUser.dart';
import 'package:datn/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDetailController extends GetxController with StateMixin {
  late Rx<User> user = User(name: '', phone: '', history: []).obs;
  late RxString id = "".obs;
  Timer? timer;
  Rx<DateTime> focusTime = DateTime.now().obs;
  Rx<DateTime?> startTime = null.obs;
  Rx<DateTime?> endTime = null.obs;
  Rx<DateTime?> selectTime = DateTime.now().obs;
  RxList<HistoryUser> history = <HistoryUser>[].obs;
  var rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  RxList<CameraModel> cameras = <CameraModel>[].obs;
  RxList<CameraSumTime> cameraSum = <CameraSumTime>[].obs;


  @override
  Future<void> onInit() async {
    id.value = Get.parameters["id"] as String;
    change(null, status: RxStatus.loading());
    user.value = (await UserApi.instance.getInforUserById(id.value))!;
    cameras.value = await CameraApi.instance.getAllCamera();
    await updateEvent();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => realTimeUpdate());
    super.onReady();
  }

  updateDataSource() async {
    if (id.value != null) {
      user.value = (await UserApi.instance.getInforUserById(id.value))!;
      change(null, status: RxStatus.success());
    }
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
    final Style timesNewRomanStyle = workbook.styles.add('timesNewRomanStyle');
    timesNewRomanStyle.fontName = 'TimesNewRoman';

    //header text style
    final Style headerTextStyle = workbook.styles.add('headerTextStyle');
    headerTextStyle.bold = true;
    headerTextStyle.fontName = 'TimesNewRoman';
    headerTextStyle.fontSize = 14;

    sheet.getRangeByName('A1').setText('Thời gian');
    sheet.getRangeByName('B1').setText('Camera');
    sheet.getRangeByName('C1').setText('X_min');
    sheet.getRangeByName('D1').setText('Y_min');
    sheet.getRangeByName('E1').setText('X_max');
    sheet.getRangeByName('F1').setText('Y_max');

    for (var i = 0; i < user.value.history.length; i++) {
      final item = user.value.history[i];
      sheet.getRangeByIndex(i + 2, 1).setDateTime(item.timeStamp);
      sheet.getRangeByIndex(i + 2, 2).setText(item.cameraId);
      if (item.position != null) {
        final position = parsePosition(item.position!);
        sheet.getRangeByIndex(i + 2, 3).setNumber(position[0]);
        sheet.getRangeByIndex(i + 2, 4).setNumber(position[1]);
        sheet.getRangeByIndex(i + 2, 5).setNumber(position[2]);
        sheet.getRangeByIndex(i + 2, 6).setNumber(position[3]);
      }
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await saveAndLaunchFile(bytes, 'Test${user.value.phone}.xlsx');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    //Get the storage folder location using path_provider package.
    String? path;
    if (Platform.isAndroid || Platform.isIOS) {
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
    final File file = File(Platform.isWindows
        ? '$path\\$fileName'
        : '/storage/emulated/0/Download/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (Platform.isAndroid || Platform.isIOS) {
      //Launch the file (used open_file package)
      // emit(state.copyWith(filePath: '/storage/emulated/0/Download/$fileName'));
      // await open_file.OpenFile.open('/storage/emulated/0/Download/${fileName}');
      Get.snackbar("Saving", "Lưu file thành công");
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

  Future<void> deleteUser() async {
    var res = await UserApi.instance.deleteUser(id.value);
    if (res == 200) {
      Get.snackbar("Success", "Xoá thành công!",
          backgroundColor: Colors.white, colorText: Colors.purple);
      // users.value = await UserApi.instance.getListUser();
      // updateListUser();
      change(null, status: RxStatus.success());
    } else {
      Get.snackbar("Error", "Có lỗi xảy ra!",
          backgroundColor: Colors.white, colorText: Colors.purple);
    }
  }

  changeSelectAndFocusTime(DateTime? selectedDate) async {
    focusTime.value = selectedDate!;
    selectTime.value = selectedDate;
    startTime.value = null; // Important to clean those
    endTime.value = null;
    rangeSelectionMode.value = RangeSelectionMode.toggledOff;
    await updateEvent();
  }

  onPageChanged(DateTime? focusedDay) {
    focusTime.value = focusedDay!;
  }

  changeRangeTime(DateTime? start, DateTime? end, DateTime? focusedDay) {
    selectTime.value = null;
    focusTime.value = focusedDay!;
    startTime.value = start;
    endTime.value = end;
    rangeSelectionMode.value = RangeSelectionMode.toggledOn;
  }

  changeFormatCanlendar() {}

  realTimeUpdate() async {
    if (isSameDay(selectTime.value, DateTime.now())) {
      await updateEvent();
    }
  }

  updateEvent() async {
    DateTime end = selectTime.value!.add(const Duration(days: 1));
    history.value =
        (await UserApi.instance.getHistory(id.value, selectTime.value!, end)) ??
            [];
    calculateTotalTime();
    print(cameraSum.value.length);
    change(null, status: RxStatus.success());
  }

  calculateTotalTime() async {
    cameraSum.value = [];
    if (history.value.length > 3 && cameras.value.isNotEmpty) {
      List<HistoryUser> listHistories = history.value;
      Map<String, int> cameraTotalTime = {cameras.value.first.name: 0};
      for (int i = 0; i < cameras.value.length; i++) {
        cameraTotalTime[cameras.value[i].name] = 0;
      }
      String currentCamera = listHistories.first.cameraId;
      String afterCamera = listHistories.first.cameraId;
      DateTime currentTime = listHistories.first.timeStamp;
      DateTime afterTime = listHistories.first.timeStamp;
      for (int index = 1; index < listHistories.length - 1; index++) {
        afterCamera = listHistories[index].cameraId;
        afterTime = listHistories[index].timeStamp;
        if (afterCamera != currentCamera) {
          cameraTotalTime[currentCamera] =
              (cameraTotalTime[currentCamera] ?? 0) -
                  (afterTime.difference(currentTime).inSeconds);
          currentCamera = afterCamera;
          currentTime = afterTime;
        }
      }
      cameraTotalTime[currentCamera] = (cameraTotalTime[currentCamera] ?? 0) -
          (listHistories[listHistories.length - 1]
              .timeStamp
              .difference(currentTime)
              .inSeconds);

      for (int i = 0; i < cameras.value.length; i++) {
        if (cameras.value[i].type == 'ROOM'){
          print(cameras.value[i].name);
          print(cameraTotalTime[cameras.value[i].name] ?? 0);
          cameraSum.value.add(CameraSumTime(cameras.value[i].name,cameraTotalTime[cameras.value[i].name] ?? 0));
        }
      }
    }
  }
}

class CameraSumTime{
  final String name;
  final int total;
  CameraSumTime(this.name, this.total);
}