import 'package:datn/constants/network.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/models/events.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class CameraApi {
  static CameraApi _instance = CameraApi._();
  CameraApi._();
  static CameraApi get instance => _instance;
  Dio clientDio = Dio();
  final getStorage = GetStorage();

  getAllCamera() async{
    List<CameraModel> cameras = [];
    try {
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.get(Endpoints.getAllCameras,
           options: options);
      if (res.statusCode == 200) {
        print(res.data);
        for (var i in res.data) {
          CameraModel s = CameraModel.fromJson(i);
          cameras.add(s);
        }
      }
      return cameras;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  getInfoCamera(String id) async {
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      print(id);
      var res = await clientDio.get("${Endpoints.getAllCameras}/$id",
          options: options);

      print(res.statusCode);
      if (res.statusCode == 200){
        print(res.data);
        CameraModel camera = CameraModel.fromJson(res.data);
        return camera;
      }


    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  getInforCameraByIp(String ip, DateTime dateTime) async {
    try{
      final token = getStorage.read('token');
      DateTime startTime = dateTime.subtract(const Duration(minutes: 1));
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.get("${Endpoints.getAllCameras}/ip/$ip/${startTime.toString()}/${dateTime.toString()}",
          options: options);

      if (res.statusCode == 200){
        print(res.data);
        CameraModel camera = CameraModel.fromJson(res.data);
        return camera;
      }


    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  createCamera(CameraModel cameraModel) async{
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.post(Endpoints.getAllCameras,
          options: options, data: cameraModel.toJson());
      if (res.statusCode == 201 && res.data != null){

        return res.statusCode;
      }

    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  getEventCamera(String ip) async {
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.get("${Endpoints.getAllCameras}/events/$ip",
          options: options);
      if (res.statusCode == 200 && res.data != null){
        print(res.data);
        EventModel eventModel = EventModel.fromJson(res.data);
        print(eventModel);
        return eventModel;
      }

    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  deleteCamera(String id) async{
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.delete("${Endpoints.getAllCameras}/$id",
          options: options);
      return res.statusCode;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  getCheckInDoorCamera(String id) async {
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization':'Bearer $token'});
      var res = await clientDio.get("${Endpoints.getAllCameras}/door/$id", options: options);
      if (res.statusCode == 200 && res.data != null){
        CameraModel camera = CameraModel.fromJson(res.data);
        return camera;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }


  }

  updateCamera(String id, String name, String room) async {
    try{
      final token = getStorage.read('token');
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await clientDio.patch("${Endpoints.getAllCameras}/$id",
          options: options, data: {
            "name": name,
            "room": room
          });
      return res.statusCode;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
